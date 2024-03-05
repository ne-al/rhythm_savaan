import 'package:isar/isar.dart';

part 'user_model.g.dart';

@Collection()
class User {
  Id? id;
  String? username;
}
