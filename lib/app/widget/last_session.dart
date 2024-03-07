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

Widget lastSessionWidget(WidgetRef ref) {
  return ref.watch(lastSessionProvider).when(
        data: (lastSessionData) {
          String songIds = lastSessionData.map((e) => e.songId).toString();

          String ids = removeParenthesesAndSpaces(songIds);

          return ref.watch(lastSessionSongByIdsProvider(ids)).when(
                data: (data) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      if (data.isNotEmpty) {
                        return SongTile(data: data[index]);
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  );
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
