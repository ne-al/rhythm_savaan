import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:rhythm_savaan/app/widget/song_tile.dart';
import 'package:rhythm_savaan/core/models/freezed_models/album_model.dart';
import 'package:rhythm_savaan/core/models/freezed_models/helper_models/songs_model.dart';
import 'package:rhythm_savaan/core/models/freezed_models/playlist_model.dart';
import 'package:rhythm_savaan/core/providers/music_providers.dart';

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
    return Scaffold(
      body: SafeArea(
        child: type == 'album'
            ? ref.watch(albumByIdProvider(id)).when(
                  data: (albumData) {
                    return _albumView(albumData);
                  },
                  error: (error, stackTrace) => Center(
                    child: Text('$error'),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                )
            : type == 'song'
                ? ref.watch(songByIdProvider(id)).when(
                      data: (songData) {
                        return _songView(songData);
                      },
                      error: (error, stackTrace) => Center(
                        child: Text('$error'),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    )
                : type == 'playlist'
                    ? ref.watch(playlistByIdProvider(id)).when(
                          data: (playlistData) {
                            return _playlistView(playlistData);
                          },
                          error: (error, stackTrace) => Center(
                            child: Text('$error'),
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

Widget _albumView(AlbumModel albumData) {
  return Column(
    children: [
      CachedNetworkImage(imageUrl: albumData.image[2]!.link),
      const Gap(12),
      ListView.builder(
        shrinkWrap: true,
        itemCount: albumData.songs.length,
        itemBuilder: (BuildContext context, int index) {
          var data = albumData.songs[index];
          return SongTile(data: data!);
        },
      ),
    ],
  );
}

Widget _songView(SongsModel songData) {
  return Column(
    children: [
      CachedNetworkImage(imageUrl: songData.image[2].link),
      const Gap(12),
      ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return SongTile(data: songData);
        },
      ),
    ],
  );
}

Widget _playlistView(SaavanPlaylistModel playlistData) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: playlistData.image[2].link,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Text(
            playlistData.name,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: playlistData.songs.length,
          itemBuilder: (BuildContext context, int index) {
            var data = playlistData.songs[index];
            return SongTile(data: data);
          },
        ),
      ],
    ),
  );
}
