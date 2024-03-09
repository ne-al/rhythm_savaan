import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:rhythm_savaan/app/helper/helper.dart';
import 'package:rhythm_savaan/app/screens/player/music_player.dart';
import 'package:rhythm_savaan/core/providers/music_providers.dart';
import 'package:rhythm_savaan/core/services/music_service.dart';
import 'package:rhythm_savaan/main.dart';

class MiniPlayer extends ConsumerWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    return Visibility(
        visible: ref.watch(isPlayingProvider).when(
                  data: (data) => data,
                  error: (error, stackTrace) => false,
                  loading: () => false,
                ) ??
            false,
        child: ref.watch(mediaItemProvider).when(
              data: (data) {
                return ref.watch(songByIdProvider(data?.id ?? '')).when(
                      data: (songsData) {
                        String title = Helper().fixTitle(data?.title ?? '');
                        return GestureDetector(
                          onTap: () async {
                            if (!context.mounted) return;
                            pushNewScreen(
                              context,
                              screen: MusicPlayer(
                                songsModel: songsData,
                                fromMiniplayer: true,
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(
                                6,
                              ),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: CachedNetworkImage(
                                    imageUrl: data?.artUri.toString() ?? '',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Gap(12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: width * 0.45,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              title,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade200,
                                              ),
                                            ),
                                            Text(
                                              songsData.primaryArtists,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey.shade500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Gap(4),
                                      progressBarController(
                                        positionDataStream,
                                        MediaQuery.of(context).size.width,
                                        true,
                                      ),
                                    ],
                                  ),
                                ),
                                _musicControllers()
                              ],
                            ),
                          ),
                        );
                      },
                      error: (error, stackTrace) => Container(),
                      loading: () => Container(),
                    );
              },
              error: (error, stackTrace) => Container(),
              loading: () => Container(),
            ));
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
