import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:rhythm_savaan/app/widget/song_tile.dart';
import 'package:rhythm_savaan/core/models/freezed_models/album_model.dart';
import 'package:rhythm_savaan/core/models/freezed_models/helper_models/songs_model.dart';
import 'package:rhythm_savaan/core/models/freezed_models/playlist_model.dart';
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
    return Scaffold(
      body: SafeArea(
        child: type == 'album'
            ? ref.watch(albumByIdProvider(id)).when(
                  data: (albumData) {
                    return _albumView(albumData, height);
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
                        return _songView(songData, height);
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
                            return _playlistView(playlistData, height);
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

Widget _albumView(AlbumModel albumData, double height) {
  return Column(
    children: [
      SizedBox(
        height: height * 0.45,
        child: CachedNetworkImage(imageUrl: albumData.image[2]!.link),
      ),
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

Widget _songView(SongsModel songData, double height) {
  return Column(
    children: [
      SizedBox(
        height: height * 0.45,
        child: CachedNetworkImage(imageUrl: songData.image[2].link),
      ),
      const Gap(6),
      // _playAll(),
      const Row(
        children: [Expanded(child: Divider())],
      ),
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

Widget _playlistView(SaavanPlaylistModel playlistData, double height) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.45,
          child: CachedNetworkImage(
            imageUrl: playlistData.image[2].link,
          ),
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
        _playAll(playlistData.songs),
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

Widget _playAll(List<SongsModel> songsList) {
  List<MediaItem> songsItem = [];
  for (var song in songsList) {
    MediaItem item = MediaItem(
        id: song.id,
        title: song.name,
        artUri: Uri.parse(song.image[2].link),
        duration: Duration(seconds: int.parse(song.duration)),
        artist: song.primaryArtists,
        extras: {
          'url': song.downloadUrl[4].link,
        });

    songsItem.add(item);
  }
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        OutlinedButton.icon(
          icon: const Icon(Icons.play_arrow_rounded),
          onPressed: () {
            if (audioHandler.queue.value.isNotEmpty) {
              audioHandler.queue.value.clear();
            }

            // if (audioHandler.queue.value.)

            audioHandler.addQueueItems(songsItem);
            audioHandler.play();
          },
          label: const Text('Play all'),
        ),
        const Gap(12),
        ElevatedButton.icon(
          icon: const Icon(Icons.shuffle_rounded),
          onPressed: () {
            if (audioHandler.queue.value.isNotEmpty) {
              audioHandler.queue.value.clear();
            }

            // if (audioHandler.queue.value.)
            audioHandler.setShuffleMode(AudioServiceShuffleMode.all);
            audioHandler.addQueueItems(songsItem);
            audioHandler.play();
          },
          label: const Text('Shuffle'),
        ),
      ],
    ),
  );
}
