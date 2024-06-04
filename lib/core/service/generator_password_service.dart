import 'dart:math';

import '../../feture/genrator/data/model/generator_password_model_result.dart';

class RandomPasswordGenerator {
  Future<GeneratorPasswordResultModel> createRandomPassword({
    bool lowerCaseValue = true,
    bool upperCaseValue = false,
    bool numbersValue = false,
    bool symbolValue = false,
    double passwordLength = 8,
  }) async {
    if (lowerCaseValue == false &&
        upperCaseValue == false &&
        symbolValue == false &&
        numbersValue == false) {
      lowerCaseValue = true;
    }
    String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
    String upperCaseLetters = lowerCaseLetters.toUpperCase();
    String numbers0 = "0123456789";
    String special = "@#=+!£\$%&?[](){}";
    String allowedChars = "";
    allowedChars += (lowerCaseValue ? lowerCaseLetters : '');
    allowedChars += (upperCaseValue ? upperCaseLetters : '');
    allowedChars += (numbersValue ? numbers0 : '');
    allowedChars += (symbolValue ? special : '');

    int i = 0;
    String result = "";
    while (i < passwordLength.round()) {
      int randomInt = Random.secure().nextInt(allowedChars.length);
      result += allowedChars[randomInt];
      i++;
    }

    return GeneratorPasswordResultModel(
        passwordValue: result,
        passowrdCheckValue: checkPassword(password: result));
  }

  double checkPassword({required String password}) {
    if (password.isEmpty) return 0.0;

    double bonus;
    if (RegExp(r'^[a-z]*$').hasMatch(password)) {
      bonus = 1.0;
    } else if (RegExp(r'^[a-z0-9]*$').hasMatch(password)) {
      bonus = 1.2;
    } else if (RegExp(r'^[a-zA-Z]*$').hasMatch(password)) {
      bonus = 1.3;
    } else if (RegExp(r'^[a-z\-_!?]*$').hasMatch(password)) {
      bonus = 1.3;
    } else if (RegExp(r'^[a-zA-Z0-9]*$').hasMatch(password)) {
      bonus = 1.5;
    } else {
      bonus = 1.8;
    }

    logistic(double x) {
      return 1.0 / (1.0 + exp(-x));
    }

    curve(double x) {
      return logistic((x / 3.0) - 4.0);
    }

    return curve(password.length * bonus);
  }
}
