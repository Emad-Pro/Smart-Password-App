import 'package:smart_password/feture/genrator/data/model/generator_password_model_get.dart';

import '../../../../core/generator_password_service/generator_password_service.dart';
import '../model/generator_password_model_result.dart';

abstract class GeneratorPasswordRepository {
  Future<GeneratorPasswordResultModel> genratePassword(
      GeneratorPasswordGetModel generatorPasswordModel);
}

class GeneratorPasswordRepositoryImp extends GeneratorPasswordRepository {
  @override
  Future<GeneratorPasswordResultModel> genratePassword(
      GeneratorPasswordGetModel generatorPasswordModel) async {
    final random = RandomPasswordGenerator().createRandomPassword(
        lowerCaseValue: generatorPasswordModel.lowerCase!,
        upperCaseValue: generatorPasswordModel.upperCase!,
        numbersValue: generatorPasswordModel.numbers!,
        symbolValue: generatorPasswordModel.symbol!,
        passwordLength: generatorPasswordModel.lengthPassword!.toDouble());
    return random;
  }
}
