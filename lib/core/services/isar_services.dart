import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rhythm_savaan/core/models/freezed_models/helper_models/songs_model.dart';
import 'package:rhythm_savaan/core/models/isar_models/last_session_model.dart';
import 'package:rhythm_savaan/core/models/isar_models/playlist_model.dart';
import 'package:rhythm_savaan/core/models/isar_models/song_model.dart';
import 'package:rhythm_savaan/core/models/isar_models/user_model.dart';

class IsarServices {
  static late Future<Isar> db;

  IsarServices() {
    db = openDb();
  }

  Future<void> createUser(String username) async {
    final isar = await db;
    User model = User()..username = username;

    isar.writeTxnSync(() => isar.users.putSync(model));
  }

  //! get all playlist

  //! search playlist by name

  //! create a new playlist

  //! edit playlist by id

  //! delete playlist by id

  //! fetch playlist by id

  //! fetch all songs of a playlist

  //! add song to playlist
  Future<void> addSongToFavorite(SongsModel songData) async {
    final isar = await db;
    var fetchData =
        await isar.songModels.filter().songIdEqualTo(songData.id).findAll();

    if (fetchData.isNotEmpty) return;

    SongModel song = SongModel()..songId = songData.id;

    isar.writeTxnSync(() => isar.songModels.putSync(song));
  }

  //! add song to last session
  Future<void> addSongToLastSession(String songId, String songName) async {
    final isar = await db;

    var data = await isar.lastSessions.where().songIdEqualTo(songId).findAll();

    if (data.isNotEmpty) {
      isar.writeTxn(() async {
        await isar.lastSessions.where().songIdEqualTo(songId).deleteFirst();
      });
    }

    LastSession lastSession = LastSession()
      ..songId = songId
      ..songName = songName
      ..dateTime = DateTime.now();

    isar.writeTxn(() async {
      await isar.lastSessions.put(lastSession);
    });

    if (await isar.lastSessions.where().count() > 25) {
      isar.writeTxn(() async {
        await isar.lastSessions.where().distinctBySongId().deleteFirst();
      });
    }
  }

  Stream<List<LastSession>> watchLastSession() async* {
    final isar = await db;

    yield* isar.lastSessions
        .where()
        .sortByDateTimeDesc()
        .watch(fireImmediately: true);
  }

  //! remove song from playlist

  Future<Isar> openDb() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [
          UserSchema,
          PlaylistModelSchema,
          SongModelSchema,
          LastSessionSchema,
        ],
        inspector: true,
        directory: dir.path,
      );
      return isar;
    }
    return Future.value(Isar.getInstance());
  }
}
