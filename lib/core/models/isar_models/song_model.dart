import 'package:isar/isar.dart';
import 'package:rhythm_savaan/core/models/isar_models/playlist_model.dart';

part 'song_model.g.dart';

@Collection()
class SongModel {
  Id id = Isar.autoIncrement;
  late String songId;
  late String title;
  late String author;
  late String duration;
  late String thumbnail;
  late String songUrl;

  final playlists = IsarLinks<PlaylistModel>();
}
