import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_password/core/enum/request_state.dart';

import 'package:smart_password/feture/genrator/data/model/generator_password_model_get.dart';
import 'package:smart_password/feture/genrator/data/repo/generator_repository.dart';

import '../../../../../core/database/model/isar_database.dart';
import '../../../../../core/database/model/password_generation_model.dart';
import '../../../data/model/generator_password_model_result.dart';

part 'generator_state.dart';

class GeneratorCubit extends Cubit<GeneratorState> {
  GeneratorCubit(this.generatorPasswordRepository)
      : super(const GeneratorState());
  final GeneratorPasswordRepository generatorPasswordRepository;
  TextEditingController passwordTextEditingController = TextEditingController();
  void changeSliderValue(int value) {
    emit(state.copyWith(sliderValue: value));
  }

  void changeUpperCaseValue(bool value) {
    emit(state.copyWith(upperCaseValue: value, lowerCaseIsEnable: true));
    deiableAllValuesStatement();
  }

  void changelowerCaseValue(bool value) {
    emit(state.copyWith(lowerCaseValue: value));
    deiableAllValuesStatement();
  }

  void changesymbolValue(bool value) {
    emit(state.copyWith(symbolValue: value, lowerCaseIsEnable: true));
    deiableAllValuesStatement();
  }

  void changesnumberValue(bool value) {
    emit(state.copyWith(numbersValue: value, lowerCaseIsEnable: true));
    deiableAllValuesStatement();
  }

  deiableAllValuesStatement() {
    if (state.upperCaseValue == false &&
        state.numbersValue == false &&
        state.symbolValue == false) {
      return emit(
          state.copyWith(lowerCaseValue: true, lowerCaseIsEnable: false));
    }
  }

  savedPasswodToDatabase(context) {
    IsarDatabase()
        .addData(
      PasswordsGenerationModel()
        ..passwordText = passwordTextEditingController.text
        ..dateTime = DateTime.now(),
    )
        .then((onValue) {
      showInSnackBar("Saved Passwod Successfly", context);
    });
  }

  void restorAllData() {
    passwordTextEditingController.clear();
    resetValue();
    emit(state.copyWith(requestPasswordState: RequestState.loading));
  }

  void resetValue() {
    emit(state.copyWith(
        numbersValue: false,
        sliderValue: 8,
        symbolValue: false,
        upperCaseValue: false,
        lowerCaseValue: true,
        lowerCaseIsEnable: false));
  }

  Future genratorPasswordMethod(
      GeneratorPasswordGetModel generatorPasswordGetModel) async {
    final result = await generatorPasswordRepository
        .genratePassword(generatorPasswordGetModel);
    passwordTextEditingController.text = result.passwordValue!;
    emit(state.copyWith(
        passwordResultModel: result,
        requestPasswordState: RequestState.success));
  }

  void showInSnackBar(String value, context) {
    var snackBar = SnackBar(content: Text(value));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String valueTextPassword(double strength) {
    return strength > 0.0 && strength <= 0.2
        ? "Weak password"
        : strength > 0.2 && strength <= 0.4
            ? "Medium strength password"
            : strength > 0.4 && strength <= 0.6
                ? "Strong password"
                : strength > 0.6 && strength <= 0.8
                    ? "A very strong password"
                    : "unbreakable password";
  }

  Color checkPasswordColor(double strength) {
    return strength > 0.0 && strength <= 0.2
        ? Colors.red
        : strength > 0.2 && strength <= 0.4
            ? Colors.yellow
            : strength > 0.4 && strength <= 0.6
                ? Colors.amber
                : strength > 0.6 && strength <= 0.8
                    ? Colors.orange
                    : Colors.green;
  }
}
