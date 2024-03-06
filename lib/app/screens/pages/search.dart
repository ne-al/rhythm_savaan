import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:rhythm_savaan/app/screens/player/music_player.dart';
import 'package:rhythm_savaan/core/providers/music_providers.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  void search() async {
    searchFocusNode.unfocus();
    if (searchController.text.trim().isEmpty) return;

    //! perform query
    ref.invalidate(searchProvider);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          focusNode: searchFocusNode,
          onSubmitted: (value) {
            search();
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            hintText: 'Search music',
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
            filled: true,
            contentPadding: const EdgeInsets.all(0),
            fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: ref
          .watch(searchProvider(searchController.text.trim().isEmpty
              ? 'punjabi songs'
              : searchController.text.trim()))
          .when(
            data: (musicData) {
              return ListView.builder(
                itemCount: musicData.length,
                itemBuilder: (context, index) {
                  var data = musicData[index];
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
                      title: Text(data.name),
                      subtitle: Text(
                        data.primaryArtists,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              );
            },
            error: (error, stackTrace) => Center(
              child: Text('$error'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }
}
