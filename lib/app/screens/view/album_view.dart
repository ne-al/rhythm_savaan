import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:rhythm_savaan/app/widget/song_tile.dart';
import 'package:rhythm_savaan/core/constants/const.dart';
import 'package:rhythm_savaan/core/models/helper_models/songs_model.dart';
import 'package:rhythm_savaan/core/providers/music_providers.dart';
import 'package:rhythm_savaan/main.dart';

class AlbumView extends ConsumerWidget {
  final String id;
  final String type;
  const AlbumView({
    super.key,
    required this.id,
    required this.type,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: type == 'album'
            ? ref.watch(albumByIdProvider(id)).when(
                  data: (albumData) {
                    return _playlistView(
                      albumData.name,
                      albumData.image[2]!.link,
                      albumData.songs,
                      height,
                      width,
                      context,
                    );
                  },
                  error: (error, stackTrace) => const Center(
                    child: Text(unknownError),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                )
            : type == 'song'
                ? ref.watch(songByIdProvider(id)).when(
                      data: (songData) {
                        return _songView(songData, height, context);
                      },
                      error: (error, stackTrace) => const Center(
                        child: Text(unknownError),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    )
                : type == 'playlist'
                    ? ref.watch(playlistByIdProvider(id)).when(
                          data: (playlistData) {
                            return _playlistView(
                              playlistData.name,
                              playlistData.image[2].link,
                              playlistData.songs,
                              height,
                              width,
                              context,
                            );
                          },
                          error: (error, stackTrace) => const Center(
                            child: Text(unknownError),
                          ),
                          loading: () => const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        )
                    : const Center(
                        child: Text('Unknown type'),
                      ),
      ),
    );
  }
}

Widget _songView(SongsModel songData, double height, BuildContext context) {
  String thumbnail = songData.image[2].link;
  String name = songData.name;
  List<SongsModel> songList = [];
  songList.add(songData);

  return CustomScrollView(
    slivers: [
      SliverAppBar(
        floating: true,
        expandedHeight: height * 0.25,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            color: Theme.of(context).colorScheme.background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: thumbnail,
                          fit: BoxFit.cover,
                          height: height * 0.14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                            Text(
                              'Songs: ${songList.length}',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _playAll(songList),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      SliverList.builder(
        itemCount: songList.length,
        itemBuilder: (context, index) {
          var data = songList[index];
          return SongTile(data: data);
        },
      )
    ],
  );
}

Widget _playAll(List<SongsModel?> songsList) {
  List<MediaItem> songsItem = [];
  for (var song in songsList) {
    MediaItem item = MediaItem(
        id: song!.id,
        title: song.name,
        artUri: Uri.parse(song.image[2].link),
        duration: Duration(seconds: int.parse(song.duration)),
        artist: song.primaryArtists,
        extras: {
          'url': song.downloadUrl[4].link,
        });

    songsItem.add(item);
  }
  return Expanded(
    child: Row(
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.play_arrow_rounded),
          onPressed: () async {
            await audioHandler.setShuffleMode(AudioServiceShuffleMode.none);
            audioHandler.updateQueue(songsItem);
            audioHandler.play();
          },
          label: const Text('Play all'),
        ),
        const Gap(6),
        SizedBox(
          width: 65,
          child: IconButton.outlined(
            icon: const Icon(Icons.shuffle_rounded),
            onPressed: () async {
              await audioHandler.setShuffleMode(AudioServiceShuffleMode.all);
              audioHandler.updateQueue(songsItem);
              audioHandler.play();
            },
          ),
        ),
      ],
    ),
  );
}

Widget _playlistView(String name, String thumbnail, List<SongsModel?> songsData,
    double height, double width, BuildContext context) {
  return CustomScrollView(
    slivers: [
      SliverAppBar(
        floating: true,
        expandedHeight: height * 0.25,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            color: Theme.of(context).colorScheme.background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: thumbnail,
                          fit: BoxFit.cover,
                          height: height * 0.14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                            Text(
                              'Songs: ${songsData.length}',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _playAll(songsData),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      SliverList.builder(
        itemCount: songsData.length,
        itemBuilder: (context, index) {
          var data = songsData[index];
          return SongTile(data: data!);
        },
      )
    ],
  );
}
