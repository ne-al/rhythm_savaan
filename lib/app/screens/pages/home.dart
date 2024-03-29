import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:rhythm_savaan/app/screens/view/album_view.dart';
import 'package:rhythm_savaan/app/widget/last_session.dart';
import 'package:rhythm_savaan/core/constants/const.dart';
import 'package:rhythm_savaan/core/providers/isar_providers.dart';
import 'package:rhythm_savaan/core/providers/music_providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: () {
          return ref.refresh(lastSessionProvider.future);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              title: Row(
                children: [
                  Icon(
                    Icons.music_note_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Gap(4),
                  Text(
                    'RHYTHM',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    children: [
                      //! Recent plays data
                      lastSessionWidget(ref, context),

                      //! Trending songs data
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                        child: Row(
                          children: [
                            Text(
                              'Trending',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Scrollbar(
                          child: SizedBox(
                            height: height * 0.20,
                            child: ref
                                .watch(homeTrendingAlbumRecommendationProvider)
                                .when(
                                  data: (albumData) {
                                    return GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        mainAxisSpacing: 12,
                                      ),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: albumData.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var data = albumData[index];
                                        return GestureDetector(
                                          onTap: () {
                                            pushNewScreen(
                                              context,
                                              screen: AlbumView(
                                                id: data.id,
                                                type: data.type,
                                              ),
                                              withNavBar: false,
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                image:
                                                    CachedNetworkImageProvider(
                                                        data.image[2]!.link),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  error: (error, stackTrace) {
                                    return const Center(
                                      child: Text(unknownError),
                                    );
                                  },
                                  loading: () => const Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  ),
                                ),
                          ),
                        ),
                      ),

                      //! Album
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                        child: Row(
                          children: [
                            Text(
                              'Latest Releases',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Scrollbar(
                          child: SizedBox(
                            height: height * 0.20,
                            child: ref
                                .watch(homeAlbumRecommendationProvider)
                                .when(
                                  data: (albumData) {
                                    return GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        mainAxisSpacing: 12,
                                      ),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: albumData.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var data = albumData[index];
                                        return GestureDetector(
                                          onTap: () {
                                            pushNewScreen(
                                              context,
                                              screen: AlbumView(
                                                id: data.id,
                                                type: data.type,
                                              ),
                                              withNavBar: false,
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                image:
                                                    CachedNetworkImageProvider(
                                                        data.image[2]!.link),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  error: (error, stackTrace) => const Center(
                                    child: Text(unknownError),
                                  ),
                                  loading: () => const Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  ),
                                ),
                          ),
                        ),
                      ),

                      //! Popular playlists data

                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                        child: Row(
                          children: [
                            Text(
                              'Popular Playlists',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Scrollbar(
                          child: SizedBox(
                            height: height * 0.20,
                            child: ref
                                .watch(homePlaylistRecommendationProvider)
                                .when(
                                  data: (playlistData) {
                                    return GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        mainAxisSpacing: 12,
                                      ),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: playlistData.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var data = playlistData[index];
                                        return GestureDetector(
                                          onTap: () {
                                            pushNewScreen(
                                              context,
                                              screen: AlbumView(
                                                id: data.id,
                                                type: data.type,
                                              ),
                                              withNavBar: false,
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                image:
                                                    CachedNetworkImageProvider(
                                                        data.image[2].link),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  error: (error, stackTrace) => const Center(
                                    child: Text(unknownError),
                                  ),
                                  loading: () => const Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  ),
                                ),
                          ),
                        ),
                      ),

                      //! Top charts

                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                        child: Row(
                          children: [
                            Text(
                              'Top Charts',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Scrollbar(
                          child: SizedBox(
                            height: height * 0.20,
                            child: ref
                                .watch(homeChartsRecommendationProvider)
                                .when(
                                  data: (playlistData) {
                                    return GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        mainAxisSpacing: 12,
                                      ),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: playlistData.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var data = playlistData[index];
                                        return GestureDetector(
                                          onTap: () {
                                            pushNewScreen(
                                              context,
                                              screen: AlbumView(
                                                id: data.id,
                                                type: data.type,
                                              ),
                                              withNavBar: false,
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                image:
                                                    CachedNetworkImageProvider(
                                                        data.image[2].link),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  error: (error, stackTrace) => const Center(
                                    child: Text(unknownError),
                                  ),
                                  loading: () => const Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  ),
                                ),
                          ),
                        ),
                      ),

                      //! checking if miniplayer is visible and if visible then adding height at bottom

                      ref.watch(isPlayingProvider).when(
                            data: (data) {
                              return data ? Gap(height * 0.07) : Container();
                            },
                            error: (error, stackTrace) => Container(),
                            loading: () => Container(),
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
