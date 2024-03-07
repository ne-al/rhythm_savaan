import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:popover/popover.dart';
import 'package:rhythm_savaan/app/screens/player/music_player.dart';
import 'package:rhythm_savaan/core/models/freezed_models/helper_models/songs_model.dart';

class SongTile extends StatelessWidget {
  final SongsModel data;
  const SongTile({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        pushNewScreen(
          context,
          screen: MusicPlayer(songsModel: data),
          withNavBar: false,
        );
      },
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CachedNetworkImage(
            imageUrl: data.image[2].link,
            fit: BoxFit.cover,
            width: width * 0.15,
            height: height * 0.1,
          ),
        ),
        title: Text(
          data.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          data.primaryArtists,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                showPopover(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  context: context,
                  bodyBuilder: (context) {
                    return SizedBox(
                      height: 180,
                      width: 160,
                      child: Column(
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.playlist_add_rounded),
                            label: const Text('Add to queue'),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite),
                            label: const Text('Add to favorite'),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.album_rounded),
                            label: const Text('Add to playlist'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.more_vert_rounded),
            );
          },
        ),
      ),
    );
  }
}
