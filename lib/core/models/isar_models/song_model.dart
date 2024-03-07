import 'package:isar/isar.dart';
import 'package:rhythm_savaan/core/models/isar_models/playlist_model.dart';

part 'song_model.g.dart';

@Collection()
class SongModel {
  Id id = Isar.autoIncrement;
  @Index(
    name: 'songId',
    caseSensitive: true,
    unique: true,
    type: IndexType.hash,
  )
  late String songId;

  final playlists = IsarLinks<PlaylistModel>();
}
