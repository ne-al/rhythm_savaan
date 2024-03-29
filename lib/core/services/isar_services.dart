import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rhythm_savaan/app/utils/utils.dart';
import 'package:rhythm_savaan/core/constants/const.dart';
import 'package:rhythm_savaan/core/collections/last_session_model.dart';
import 'package:rhythm_savaan/core/collections/playlist_model.dart';
import 'package:rhythm_savaan/core/collections/song_model.dart';
import 'package:rhythm_savaan/core/collections/user_model.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsarServices {
  static late Future<Isar> db;
  final logger = Logger();
  late final SharedPreferences prefs;

  IsarServices() {
    db = openDb();
  }

  Future<void> createUser(String username) async {
    final isar = await db;
    User model = User()..username = username;

    isar.writeTxnSync(() => isar.users.putSync(model));
  }

  //! search playlist by name

  //! create a new playlist
  Future<void> createNewPlaylist(
      String playlistName, BuildContext context) async {
    final isar = await db;

    if (await isar.playlistModels
            .where()
            .playlistNameEqualTo(playlistName)
            .count() >
        0) {
      if (!context.mounted) return;

      Utils().showWarningToast(
        'Playlist name already exists.',
        context,
      );
      return;
    }

    PlaylistModel playlistModel = PlaylistModel()
      ..playlistName = playlistName
      ..playlistId = const Uuid().v4()
      ..dateTime = DateTime.now();

    try {
      isar.writeTxn(() async {
        await isar.playlistModels.put(playlistModel);
      });

      if (!context.mounted) return;

      Utils().showSuccessToast('Playlist has been created', context);
    } catch (e) {
      if (!context.mounted) return;

      Utils().showErrorToast('Some unknown error has ocurred', context);
    }
  }

  //! get all playlist
  Stream<List<PlaylistModel>> getAllPlaylist() async* {
    final isar = await db;

    yield* isar.playlistModels
        .where()
        .sortByIsPinnedDesc()
        .thenByDateTimeDesc()
        .watch(fireImmediately: true);
  }

  //! add song to playlist by playlist name
  Future<void> addSongToPlaylistByName(
      String playlistName, String songId) async {
    final isar = await db;

    final data = await isar.playlistModels
        .filter()
        .playlistNameEqualTo(playlistName)
        .findFirst();

    final song = SongModel()
      ..songId = songId
      ..dateTime = DateTime.now()
      ..playlists.value = data;

    isar.writeTxnSync(() => isar.songModels.putSync(song));
  }

  //! get playlist data by name
  Future<List<SongModel>> getPlaylistDataByName(String playlistName) async {
    final isar = await db;

    return await isar.songModels
        .filter()
        .playlists((q) => q.playlistNameEqualTo(playlistName))
        .findAll();
  }

  //! edit playlist by id

  //! delete playlist by id
  Future<void> deletePlaylistById(
      String playlistId, BuildContext context) async {
    final isar = await db;

    try {
      isar.writeTxn(() async {
        await isar.songModels
            .filter()
            .playlists((q) => q.playlistIdEqualTo(playlistId))
            .deleteAll();

        await isar.playlistModels
            .filter()
            .playlistIdEqualTo(playlistId)
            .deleteFirst();
      });

      if (!context.mounted) return;
      Utils().showErrorToast('Playlist has been deleted', context);
    } catch (e) {
      if (!context.mounted) return;
      Utils().showErrorToast('Some unknown error has ocurred', context);
    }
  }

  //! fetch playlist by id
  Stream<List<PlaylistModel>> fetchPlaylistById(String playlistId) async* {
    final isar = await db;

    yield* isar.playlistModels
        .where()
        .playlistIdEqualTo(playlistId)
        .watch(fireImmediately: true);
  }

  //! fetch all songs of a playlist
  Stream<List<SongModel>> fetchAllSongsOfPlaylist(String playlistId) async* {
    final isar = await db;

    yield* isar.songModels
        .filter()
        .playlists((q) => q.playlistIdEqualTo(playlistId))
        .sortByDateTimeDesc()
        .watch(fireImmediately: true);
  }

  //! add song to favorite playlist
  Future<void> addSongToFavorite(String songId) async {
    final isar = await db;
    var fetchData =
        await isar.songModels.filter().songIdEqualTo(songId).findAll();

    if (fetchData.isNotEmpty) return;

    final playlist = await isar.playlistModels
        .filter()
        .playlistIdEqualTo(favPlaylistNameAndId)
        .findFirst();

    SongModel song = SongModel()
      ..songId = songId
      ..dateTime = DateTime.now()
      ..playlists.value = playlist;

    isar.writeTxnSync(() => isar.songModels.putSync(song));
  }

  //! check if current song is liked or not
  Stream<bool> isSongLiked(String songId) async* {
    final isar = await db;

    yield* isar.playlistModels
        .filter()
        .song((q) => q.songIdEqualTo(songId))
        .watch(fireImmediately: true)
        .map((event) => event.isEmpty);
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

  //! stream recently played songs
  Stream<List<LastSession>> watchLastSession() async* {
    final isar = await db;

    yield* isar.lastSessions
        .where()
        .sortByDateTimeDesc()
        .watch(fireImmediately: true);
  }

  //!init user
  //! this function will be called if user does'nt already exists in database
  Future<void> initUser() async {
    final isar = await db;
    prefs = await SharedPreferences.getInstance();

    //! initializing favorites
    try {
      PlaylistModel favorite = PlaylistModel()
        ..isPinned = true
        ..playlistId = favPlaylistNameAndId
        ..playlistName = favPlaylistNameAndId
        ..dateTime = DateTime.now();

      isar.writeTxn(() async {
        await isar.playlistModels.put(favorite);
      });

      logger.w('Favorite created');

      prefs.setBool('userExists', true);
    } catch (e) {
      prefs.setBool('userExists', false);
    }
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
