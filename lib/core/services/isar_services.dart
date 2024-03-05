import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
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

  //! create a new playlist

  //! edit playlist by id

  //! delete playlist by id

  //! fetch playlist by id

  //! add song to playlist

  //! remove song from playlist

  Future<Isar> openDb() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [UserSchema],
        inspector: true,
        directory: dir.path,
      );

      return isar;
    }

    return Future.value(Isar.getInstance());
  }
}
