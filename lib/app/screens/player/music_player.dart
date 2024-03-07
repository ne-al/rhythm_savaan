import 'package:audio_service/audio_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:rhythm_savaan/core/models/freezed_models/helper_models/songs_model.dart';
import 'package:rhythm_savaan/core/providers/music_providers.dart';
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

    //! initializing the media item of the song
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

    //! it skip when the playing song is already in queue so it wont have 2 or more same song in queue
    if (audioHandler.queue.value.contains(item) &&
        audioHandler.queue.value.isEmpty) {
      return;
    }

    //! it remove current song from queue and add new one when there is song change request done by the user
    if (audioHandler.queue.value.length <= 1 &&
        !audioHandler.queue.value.contains(item)) {
      audioHandler.removeQueueItemAt(0);
    }

    //! add single song to queue then play it
    audioHandler.addQueueItem(item);
    audioHandler.play();
  }

  //! streaming the buffered position of the playing song
  Stream<Duration> get _bufferedPositionStream => audioHandler.playbackState
      .map((state) => state.bufferedPosition)
      .distinct();

  //! streaming the duration of the playing song
  Stream<Duration?> get _durationStream =>
      audioHandler.mediaItem.map((item) => item?.duration).distinct();

  //! streaming the position data of all combine things of the playing song
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
  return StreamBuilder<PlaybackState>(
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
  // return StreamBuilder(
  //   stream:
  //       audioHandler.playbackState.map((event) => event.repeatMode).distinct(),
  //   builder: (context, snapshot) {
  //     return IconButton(
  //       onPressed: () {
  //         snapshot.data!.index == 0
  //             ? audioHandler.setRepeatMode(AudioServiceRepeatMode.one)
  //             : snapshot.data!.index == 1
  //                 ? audioHandler.setRepeatMode(AudioServiceRepeatMode.group)
  //                 : audioHandler.setRepeatMode(AudioServiceRepeatMode.none);
  //       },
  //       icon: snapshot.data!.index == 0
  //           ? const Icon(Icons.repeat_rounded)
  //           : snapshot.data!.index == 1
  //               ? const Icon(Icons.repeat_one_rounded)
  //               : const Icon(Icons.repeat_on),
  //     );
  //   },
  // );

  return Consumer(
    builder: (context, ref, child) {
      return ref.watch(repeatModeStreamProvider).when(
            data: (data) {
              final repeatMode = data;
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
                      (cycleModes.indexOf(repeatMode) + 1) %
                          cycleModes.length]);
                },
              );
            },
            error: (error, stackTrace) =>
                IconButton(onPressed: () {}, icon: const Icon(Icons.repeat)),
            loading: () =>
                IconButton(onPressed: () {}, icon: const Icon(Icons.repeat)),
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
