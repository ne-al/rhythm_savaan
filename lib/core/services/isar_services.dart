import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rhythm_savaan/core/models/user_model.dart';

class IsarServices {
  late Future<Isar> db;

  IsarServices() {
    db = openDb();
  }

  Future<void> write(String username) async {
    final isar = await db;
    User model = User()..username = username;

    isar.writeTxnSync(() => isar.users.putSync(model));
  }

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
