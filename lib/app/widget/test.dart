import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rhythm_savaan/app/widget/song_tile.dart';
import 'package:rhythm_savaan/core/providers/isar_providers.dart';

class CustomPlaylist extends ConsumerWidget {
  final String playlistId;
  const CustomPlaylist({super.key, required this.playlistId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: ref.watch(getAllSongsOfPlaylistProvider(playlistId)).when(
              data: (data) {
                List<String> songIds = [];
                for (var id in data) {
                  songIds.add(id.songId);
                }

                String ids = songIds.join(",");
                return ref.watch(lastSessionSongByIdsProvider(ids)).when(
                      data: (songData) {
                        return ListView.builder(
                          itemCount: songIds.length,
                          itemBuilder: (context, index) =>
                              SongTile(data: songData[index]),
                        );
                      },
                      error: (error, stackTrace) => const Center(
                        child: Text('ERROR'),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
              },
              error: (error, stackTrace) => const Center(
                child: Text('ERROR'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
      ),
    );
  }
}
