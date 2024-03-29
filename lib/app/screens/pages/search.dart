import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:rhythm_savaan/app/widget/credit.dart';
import 'package:rhythm_savaan/app/widget/song_tile.dart';
import 'package:rhythm_savaan/core/constants/const.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ref
                .watch(searchProvider(searchController.text.trim().isEmpty
                    ? 'punjabi songs'
                    : searchController.text.trim()))
                .when(
                  data: (musicData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: musicData.length,
                      itemBuilder: (context, index) {
                        var data = musicData[index];
                        return SongTile(
                          data: data,
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) => const Center(
                    child: Text(unknownError),
                  ),
                  loading: () => const LinearProgressIndicator(),
                ),
            const Gap(20),
            const Credit(),
            const Gap(36),
            ref.watch(isPlayingProvider).when(
                  data: (data) {
                    return data ? Gap(height * 0.07) : Container();
                  },
                  error: (error, stackTrace) => Container(),
                  loading: () => Container(),
                )
          ],
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
