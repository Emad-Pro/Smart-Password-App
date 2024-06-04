import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_password/core/database/model/password_generation_model.dart';

class IsarDatabase {
  static late Isar isar;
  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar =
        await Isar.open([PasswordsGenerationModelSchema], directory: dir.path);
  }

  Future<void> addData(PasswordsGenerationModel model) async {
    final newValue = PasswordsGenerationModel() = model;
    await isar
        .writeTxn(() => isar.passwordsGenerationModels.put(newValue))
        .then((value) {})
        .catchError((onError) {});
  }

  Future<List<PasswordsGenerationModel>> getData() async {
    return await isar.passwordsGenerationModels
        .where()
        .sortByDateTime()
        .findAll();
  }

  Future<void> deleteAllData() async {
    await isar.writeTxn(() => isar.passwordsGenerationModels.clear());
  }

  Future removeWithId(int id) async {
    await isar.writeTxn(() => isar.passwordsGenerationModels.delete(id));
  }
}
