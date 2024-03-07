import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:rhythm_savaan/app/screens/player/music_player.dart';
import 'package:rhythm_savaan/core/providers/music_providers.dart';
import 'package:rhythm_savaan/core/services/music_service.dart';
import 'package:rhythm_savaan/main.dart';

class MiniPlayer extends ConsumerWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: audioHandler.mediaItem,
      builder: (context, snapshot) {
        var data = snapshot.data;
        return ref.watch(songByIdProvider(data!.id)).when(
              data: (data) => GestureDetector(
                onTap: () async {
                  if (!context.mounted) return;
                  pushNewScreen(
                    context,
                    screen: MusicPlayer(
                      songsModel: data,
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(
                        6,
                      )),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: CachedNetworkImage(
                          imageUrl: snapshot.data!.artUri.toString(),
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(snapshot.data?.title ?? 'Null'),
                            const Gap(4),
                            progressBarController(positionDataStream,
                                MediaQuery.of(context).size.width, true),
                          ],
                        ),
                      ),
                      _musicControllers()
                    ],
                  ),
                ),
              ),
              error: (error, stackTrace) => Container(),
              loading: () => Container(),
            );
      },
    );
  }
}

Widget _musicControllers() {
  return StreamBuilder<PlaybackState?>(
    stream: audioHandler.playbackState,
    builder: (context, snapshot) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            iconSize: 40,
            onPressed: () {
              snapshot.data?.playing ?? false
                  ? audioHandler.pause()
                  : audioHandler.play();
            },
            icon: snapshot.data?.playing ?? false
                ? const Icon(Icons.pause_rounded)
                : const Icon(Icons.play_arrow_rounded),
          ),
        ],
      );
    },
  );
}
