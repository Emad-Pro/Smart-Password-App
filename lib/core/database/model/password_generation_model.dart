import 'package:isar/isar.dart';
part 'password_generation_model.g.dart';

@collection
class PasswordsGenerationModel {
  Id id = Isar.autoIncrement;
  String? passwordText;
  DateTime? dateTime;
}
