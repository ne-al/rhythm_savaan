import 'package:isar/isar.dart';
import 'package:rhythm_savaan/core/collections/song_model.dart';

part 'playlist_model.g.dart';

@Collection()
class PlaylistModel {
  Id id = Isar.autoIncrement;
  late String name;
  String? description;
  String? thumbnail;
  int songs = 0;

  @Backlink(to: 'playlists')
  final song = IsarLinks<SongModel>();
}
