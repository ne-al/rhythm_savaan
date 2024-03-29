import 'package:audio_service/audio_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:rhythm_savaan/app/helper/helper.dart';
import 'package:rhythm_savaan/core/models/helper_models/songs_model.dart';
import 'package:rhythm_savaan/core/services/isar_services.dart';
import 'package:rhythm_savaan/core/services/music_service.dart';
import 'package:rhythm_savaan/main.dart';

class MusicPlayer extends ConsumerStatefulWidget {
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
  ConsumerState<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends ConsumerState<MusicPlayer> {
  //! calling init to initialize player
  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() async {
    var data = widget.songsModel;

    //! adding this song to recent plays
    IsarServices().addSongToLastSession(data.id, data.name);

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

    if (queueValue.contains(item) && queueLength <= 1) return;

    //! it checks if the queue length is greater than 1 and if the current media item i.e current song
    //! available in queue list if it does exists then get the index where the current exists
    //! and pass it to audio handler so audio handler can later play it
    if (queueLength > 1 && queueValue.contains(item)) {
      int index = queueValue.indexOf(item);
      //! skip to the queue

      await audioHandler.skipToQueueItem(index);
      audioHandler.play();

      return;
    }

    //! it skip when the playing song is already in queue so it wont have 2 or more same song in queue
    //! also after && it checks if currently user in playing any playlist
    //! if user is playing any playlist then it remove all the songs from the playlist and add the currently requested song to the queue

    //! it remove current song from queue and add new one when there is song change request done by the user
    if (queueLength <= 1 && !queueValue.contains(item)) {
      await audioHandler.removeQueueItemAt(0);
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
          mainAxisSize: MainAxisSize.max,
          children: [
            _musicThumbnailTitleWidget(widget.songsModel, width),
            const Gap(24),
            progressBarController(positionDataStream, width, false),
            const Gap(12),
            _musicControllers(widget.songsModel, ref),
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
                    Helper().fixTitle(snapshot.data?.title ?? data.name),
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
          barHeight: isMiniPlayer ? 2.5 : 3,
          thumbRadius: isMiniPlayer ? 4 : 6,
          timeLabelType: TimeLabelType.totalTime,
          thumbColor: Theme.of(context).colorScheme.secondary,
          progressBarColor: Theme.of(context).colorScheme.secondary,
          bufferedBarColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.2),
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

Widget _musicControllers(SongsModel songData, WidgetRef ref) {
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
          _likeButton(songData),
        ],
      );
    },
  );
}

Widget _likeButton(SongsModel songData) {
  return StreamBuilder(
    stream: audioHandler.mediaItem,
    builder: (context, snapshot) {
      return StreamBuilder(
        stream: IsarServices().isSongLiked(snapshot.data?.id ?? songData.id),
        builder: (context, isLiked) {
          if (isLiked.connectionState == ConnectionState.waiting) {
            return IconButton(
              onPressed: () {},
              icon: const Icon(Icons.heart_broken_rounded),
            );
          }
          if (isLiked.hasData) {
            bool liked = isLiked.data!;
            return IconButton(
              onPressed: () {
                liked
                    ? IsarServices()
                        .addSongToFavorite(snapshot.data?.id ?? songData.id)
                    : null;
              },
              icon: liked
                  ? const Icon(Icons.favorite_outline_rounded,
                      color: Colors.grey)
                  : const Icon(Icons.favorite_rounded, color: Colors.red),
            );
          }
          return IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.heart_broken_rounded,
              color: Colors.red,
            ),
          );
        },
      );
    },
  );

  // Consumer(
  //   builder: (context, ref, child) => ref.watch(mediaItemProvider).when(
  //         data: (data) {
  //           return ref.watch(isSongLikedProvider(data?.id ?? songData.id)).when(
  //                 data: (isLiked) {
  // return IconButton(
  //   onPressed: () {
  //     isLiked
  //         ? IsarServices()
  //             .addSongToFavorite(data?.id ?? songData.id)
  //         : null;
  //   },
  //   icon: isLiked
  //       ? const Icon(Icons.favorite_outline_rounded,
  //           color: Colors.grey)
  //       : const Icon(Icons.favorite_rounded,
  //           color: Colors.red),
  // );
  //                 },
  //                 error: (error, stackTrace) => IconButton(
  //                   onPressed: () {},
  //                   icon: const Icon(Icons.favorite_outline_rounded,
  //                       color: Colors.yellow),
  //                 ),
  //                 loading: () => IconButton(
  //                   onPressed: () {},
  //                   icon: const Icon(
  //                     Icons.favorite_outline_rounded,
  //                     color: Colors.red,
  //                   ),
  //                 ),
  //               );
  //         },
  //         error: (error, stackTrace) => IconButton(
  //           onPressed: () {},
  //           icon: const Icon(Icons.favorite_outline_rounded,
  //               color: Colors.yellow),
  //         ),
  //         loading: () => IconButton(
  //           onPressed: () {},
  //           icon: const Icon(
  //             Icons.favorite_outline_rounded,
  //             color: Colors.red,
  //           ),
  //         ),
  //       ),
  // );
}

Widget _repeatMode() {
  return StreamBuilder<AudioServiceRepeatMode>(
    stream:
        audioHandler.playbackState.map((state) => state.repeatMode).distinct(),
    builder: (context, snapshot) {
      final repeatMode = snapshot.data ?? AudioServiceRepeatMode.none;
      final icons = [
        const Icon(Icons.repeat, color: Colors.grey),
        Icon(Icons.repeat, color: Theme.of(context).colorScheme.secondary),
        Icon(Icons.repeat_one, color: Theme.of(context).colorScheme.secondary),
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
