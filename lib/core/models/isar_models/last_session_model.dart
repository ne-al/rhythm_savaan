import 'package:isar/isar.dart';

part 'last_session_model.g.dart';

@Collection()
class LastSession {
  Id id = Isar.autoIncrement;

  @Index(
      name: 'songId', caseSensitive: true, unique: true, type: IndexType.hash)
  late String songId;
  late String songName;
  late DateTime dateTime;
}
