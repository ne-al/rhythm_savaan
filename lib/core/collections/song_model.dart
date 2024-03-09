import 'package:isar/isar.dart';
import 'package:rhythm_savaan/core/collections/playlist_model.dart';

part 'song_model.g.dart';

@Collection()
class SongModel {
  Id id = Isar.autoIncrement;
  @Index(
      name: 'songId', caseSensitive: true, unique: true, type: IndexType.hash)
  late String songId;
  late DateTime dateTime;

  final playlists = IsarLink<PlaylistModel>();
}
