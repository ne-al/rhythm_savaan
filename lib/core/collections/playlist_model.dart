import 'package:isar/isar.dart';
import 'package:rhythm_savaan/core/collections/song_model.dart';

part 'playlist_model.g.dart';

@Collection()
class PlaylistModel {
  Id id = Isar.autoIncrement;

  @Index(name: 'playlistName', caseSensitive: true)
  late String playlistName;

  @Index(name: 'playlistId', caseSensitive: true)
  late String playlistId;

  late DateTime dateTime;

  String? description;

  String? thumbnail;

  bool isPinned = false;

  @Backlink(to: 'playlists')
  final song = IsarLinks<SongModel>();
}
