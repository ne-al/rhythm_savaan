import 'package:audio_service/audio_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rhythm_savaan/core/models/freezed_models/helper_models/songs_model.dart';
import 'package:rhythm_savaan/core/services/music_service.dart';
import 'package:rhythm_savaan/main.dart';

class MusicPlayer extends StatefulWidget {
  final SongsModel songsModel;
  final bool fromMiniplayer;
  final int songIndex;
  const MusicPlayer({
    super.key,
    this.fromMiniplayer = false,
    this.songIndex = 0,
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

    //! initializing the commonly used values
    int queueLength = audioHandler.queue.value.length;
    List<MediaItem> queueValue = audioHandler.queue.value;

    //! if it is from miniplayer then it skip all change to audio handler and keep all the data same
    if (widget.fromMiniplayer == true) {
      return;
    }

    //! it skip when the playing song is already in queue so it wont have 2 or more same song in queue
    //! also after && it checks if currently user in playing any playlist
    //! if user is playing any playlist then it remove all the songs from the playlist and add the currently requested song to the queue
    if (queueValue.contains(item) && queueLength <= 1) return;

    //! it remove current song from queue and add new one when there is song change request done by the user
    if (queueLength <= 1 && !queueValue.contains(item)) {
      audioHandler.removeQueueItemAt(0);
    }

    //! add single song to queue then play it
    await audioHandler.addQueueItem(item);
    audioHandler.play();
  }

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
            progressBarController(positionDataStream, width, false),
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

Widget progressBarController(
    Stream<PositionData> data, double width, bool isMiniPlayer) {
  return StreamBuilder<PositionData>(
    stream: data,
    builder: (context, snapshot) {
      final positionData = snapshot.data ??
          PositionData(Duration.zero, Duration.zero, Duration.zero);
      Duration progress = positionData.position;
      Duration total = positionData.duration;
      Duration buffered = positionData.bufferedPosition;
      return SizedBox(
        width: !isMiniPlayer ? width * 0.9 : width * 0.7,
        child: ProgressBar(
          barHeight: isMiniPlayer ? 2 : 5,
          thumbRadius: isMiniPlayer ? 6 : 8,
          timeLabelLocation:
              isMiniPlayer ? TimeLabelLocation.none : TimeLabelLocation.sides,
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
  return StreamBuilder<PlaybackState?>(
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
              snapshot.data?.playing ?? false
                  ? audioHandler.pause()
                  : audioHandler.play();
            },
            icon: snapshot.data?.playing ?? false
                ? const Icon(Icons.pause_rounded)
                : const Icon(Icons.play_arrow_rounded),
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
  return StreamBuilder<AudioServiceRepeatMode>(
    stream:
        audioHandler.playbackState.map((state) => state.repeatMode).distinct(),
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
