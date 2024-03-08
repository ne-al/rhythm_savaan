import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:rhythm_savaan/core/providers/isar_providers.dart';
import 'package:rhythm_savaan/core/services/isar_services.dart';

class PlaylistPage extends ConsumerStatefulWidget {
  const PlaylistPage({super.key});

  @override
  ConsumerState<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends ConsumerState<PlaylistPage> {
  final TextEditingController playlistNameController = TextEditingController();

  void createPlaylist() async {
    if (playlistNameController.text.trim().isNotEmpty &&
        playlistNameController.text.trim().length > 3) {
      IsarServices().createNewPlaylist(playlistNameController.text.trim());

      playlistNameController.clear();
    }
  }

  void addSongToPlaylist() async {
    if (playlistNameController.text.trim().isNotEmpty &&
        playlistNameController.text.trim().length > 3) {
      IsarServices().addSongToPlaylistByName(
        playlistNameController.text.trim(),
      );
    }
  }

  @override
  void dispose() {
    playlistNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlists'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(12),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: [
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(),
                      const CircleAvatar(
                        radius: 75,
                        child: Icon(
                          Icons.favorite_rounded,
                          size: 90,
                        ),
                      ),
                      const Text(
                        'Favorite',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Create new playlist'),
                              content: TextField(
                                controller: playlistNameController,
                                decoration: InputDecoration(
                                  hintText: 'Playlist name',
                                  contentPadding:
                                      const EdgeInsets.only(left: 12),
                                  filled: true,
                                  fillColor: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              actions: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel'),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    createPlaylist();
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Create'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const CircleAvatar(
                          radius: 75,
                          child: Icon(
                            Icons.add_rounded,
                            size: 100,
                          ),
                        ),
                      ),
                      const Text(
                        'Create new',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ref.watch(getAllPlaylistProvider).when(
                  data: (playlistData) {
                    return Column(
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                          child: Row(
                            children: [
                              Text(
                                'Your playlists',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        playlistData.isNotEmpty
                            ? GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: playlistData.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var data = playlistData[index];
                                  return Card(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(),
                                        const CircleAvatar(
                                          radius: 75,
                                          child: Icon(
                                            Icons.music_note_rounded,
                                            size: 100,
                                          ),
                                        ),
                                        Text(
                                          data.playlistName,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            : const Center(
                                child: Text('You don\'t have any playlist'),
                              ),
                      ],
                    );
                  },
                  error: (error, stackTrace) => const Center(
                    child: Text('Error'),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
          ],
        ),
      )),
    );
  }
}
