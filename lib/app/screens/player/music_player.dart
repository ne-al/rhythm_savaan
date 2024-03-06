import 'package:audio_service/audio_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rhythm_savaan/core/models/freezed_models/helper_models/songs_model.dart';
import 'package:rhythm_savaan/main.dart';
import 'package:rxdart/rxdart.dart';

class MusicPlayer extends StatefulWidget {
  final SongsModel songsModel;
  const MusicPlayer({
    super.key,
    required this.songsModel,
  });

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() async {
    var data = widget.songsModel;
    MediaItem item = MediaItem(
      id: data.id,
      title: data.name,
      artUri: Uri.parse(data.image[2].link),
      artist: data.primaryArtists,
      duration: Duration(seconds: int.parse(data.duration)),
      extras: {
        'url': data.downloadUrl[4].link,
      },
    );

    if (audioHandler.queue.value.contains(item)) {
      return;
    }

    if (audioHandler.queue.value.length <= 1 &&
        !audioHandler.queue.value.contains(item)) {
      audioHandler.removeQueueItemAt(0);
    }

    await audioHandler.addQueueItem(item);
    audioHandler.play();
  }

  Stream<Duration> get _bufferedPositionStream => audioHandler.playbackState
      .map((state) => state.bufferedPosition)
      .distinct();
  Stream<Duration?> get _durationStream =>
      audioHandler.mediaItem.map((item) => item?.duration).distinct();

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          AudioService.position,
          _bufferedPositionStream,
          _durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _musicThumbnailTitleWidget(widget.songsModel, width),
            const Gap(24),
            _progressBarController(_positionDataStream, width),
            const Gap(12),
            _musicControllers(),
          ],
        ),
      ),
    );
  }
}

Widget _musicThumbnailTitleWidget(SongsModel data, double width) {
  return StreamBuilder<MediaItem?>(
    stream: audioHandler.mediaItem,
    builder: (context, snapshot) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: snapshot.data?.artUri.toString() ?? data.image[2].link,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SizedBox(
              width: width * 0.8,
              child: Column(
                children: [
                  Text(
                    snapshot.data?.title ?? data.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                    ),
                  ),
                  const Gap(6),
                  Text(
                    snapshot.data?.artist ?? data.primaryArtists,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    },
  );
}

Widget _progressBarController(Stream<PositionData> data, double width) {
  return StreamBuilder<PositionData>(
    stream: data,
    builder: (context, snapshot) {
      final positionData = snapshot.data ??
          PositionData(Duration.zero, Duration.zero, Duration.zero);
      Duration progress = positionData.position;
      Duration total = positionData.duration;
      Duration buffered = positionData.bufferedPosition;
      return SizedBox(
        width: width * 0.9,
        child: ProgressBar(
          progress: progress,
          total: total,
          buffered: buffered,
          onSeek: (position) => audioHandler.seek(position),
        ),
      );
    },
  );
}

Widget _musicControllers() {
  return StreamBuilder(
    stream: audioHandler.playbackState,
    builder: (context, snapshot) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _repeatMode(),
          IconButton(
            iconSize: 50,
            onPressed: () {
              audioHandler.skipToPrevious();
            },
            icon: const Icon(Icons.skip_previous_rounded),
          ),
          IconButton(
            iconSize: 75,
            onPressed: () {
              snapshot.data!.playing
                  ? audioHandler.pause()
                  : audioHandler.play();
            },
            icon: !snapshot.data!.playing
                ? const Icon(Icons.play_arrow_rounded)
                : const Icon(Icons.pause_rounded),
          ),
          IconButton(
            iconSize: 50,
            onPressed: () {
              audioHandler.skipToNext();
            },
            icon: const Icon(Icons.skip_next_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline_rounded),
          ),
        ],
      );
    },
  );
}

Widget _repeatMode() {
  return StreamBuilder(
    stream:
        audioHandler.playbackState.map((event) => event.repeatMode).distinct(),
    builder: (context, snapshot) {
      final repeatMode = snapshot.data ?? AudioServiceRepeatMode.none;
      const icons = [
        Icon(Icons.repeat, color: Colors.grey),
        Icon(Icons.repeat, color: Colors.orange),
        Icon(Icons.repeat_one, color: Colors.orange),
      ];
      const cycleModes = [
        AudioServiceRepeatMode.none,
        AudioServiceRepeatMode.all,
        AudioServiceRepeatMode.one,
      ];
      final index = cycleModes.indexOf(repeatMode);
      return IconButton(
        icon: icons[index],
        onPressed: () {
          audioHandler.setRepeatMode(cycleModes[
              (cycleModes.indexOf(repeatMode) + 1) % cycleModes.length]);
        },
      );
    },
  );
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}
