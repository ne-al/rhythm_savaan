// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rhythm_savaan/app/widget/song_tile.dart';
import 'package:rhythm_savaan/core/providers/music_providers.dart';

// class LastSessionWidget extends ConsumerWidget {
//   const LastSessionWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       body:
//     );
//   }
// }

Widget lastSessionWidget(WidgetRef ref, BuildContext context) {
  return ref.watch(lastSessionProvider).when(
        data: (lastSessionData) {
          String songIds = lastSessionData.map((e) => e.songId).toString();

          String ids = removeParenthesesAndSpaces(songIds);

          return ref.watch(lastSessionSongByIdsProvider(ids)).when(
                data: (data) {
                  final bool rotated = MediaQuery.sizeOf(context).height <
                      MediaQuery.sizeOf(context).width;
                  final bool biggerScreen =
                      MediaQuery.sizeOf(context).width > 1050;
                  final double portion = (data.length <= 4) ? 1.0 : 0.875;
                  final double listSize = rotated
                      ? biggerScreen
                          ? MediaQuery.sizeOf(context).width * portion / 3
                          : MediaQuery.sizeOf(context).width * portion / 2
                      : MediaQuery.sizeOf(context).width * portion;
                  return data.isNotEmpty
                      ? Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 8),
                              child: Row(
                                children: [
                                  Text(
                                    'Recent plays',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                                  data.length < 4 ? data.length * 74 : 74 * 4,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(
                                      decelerationRate:
                                          ScrollDecelerationRate.fast),
                                  shrinkWrap: true,
                                  itemExtent: listSize,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: data.length > 4
                                      ? (data.length / 4).ceil()
                                      : data.length,
                                  itemBuilder: (context, index) {
                                    if (data.isNotEmpty) {
                                      final itemGroup =
                                          data.skip(index * 4).take(4);
                                      return SizedBox(
                                        width: listSize,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: itemGroup.map(
                                            (e) {
                                              return SongTile(data: e);
                                            },
                                          ).toList(),
                                        ),
                                      );
                                    } else {
                                      return const SizedBox.shrink();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container();
                },
                error: (error, stackTrace) => Center(
                  child: Text('Songs Error\n$error\n$stackTrace'),
                ),
                loading: () => const CircularProgressIndicator.adaptive(),
              );
        },
        error: (error, stackTrace) => Center(
          child: Text('Error\n$error'),
        ),
        loading: () => const CircularProgressIndicator.adaptive(),
      );
}

String removeParenthesesAndSpaces(String inputString) {
  // Remove parentheses
  String stringWithoutParentheses =
      inputString.replaceAll('(', '').replaceAll(')', '');

  // Remove spaces
  String stringWithoutSpaces = stringWithoutParentheses.replaceAll(' ', '');

  return stringWithoutSpaces;
}
