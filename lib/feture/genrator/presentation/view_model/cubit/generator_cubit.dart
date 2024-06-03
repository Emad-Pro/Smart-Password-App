import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_password/core/enum/request_state.dart';
import 'package:smart_password/core/responsive_layout/app_styles.dart';
import 'package:smart_password/feture/genrator/data/model/generator_password_model_get.dart';
import 'package:smart_password/feture/genrator/data/repo/generator_repository.dart';

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
    emit(state.copyWith(upperCaseValue: value));
  }

  void changelowerCaseValue(bool value) {
    emit(state.copyWith(lowerCaseValue: value));
  }

  void changesymbolValue(bool value) {
    emit(state.copyWith(symbolValue: value));
  }

  void changesnumberValue(bool value) {
    emit(state.copyWith(numbersValue: value));
  }

  Future genratorPasswordMethod(
      GeneratorPasswordGetModel generatorPasswordGetModel) async {
    final result = await generatorPasswordRepository
        .genratePassword(generatorPasswordGetModel);

    emit(state.copyWith(
        passwordResultModel: result,
        requestPasswordState: RequestState.success));
  }
}
