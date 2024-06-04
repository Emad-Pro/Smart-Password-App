part of 'generator_cubit.dart';

class GeneratorState extends Equatable {
  final bool upperCaseValue;
  final bool lowerCaseValue;
  final bool symbolValue;
  final bool numbersValue;
  final int sliderValue;
  final RequestState requestPasswordState;
  final GeneratorPasswordResultModel? passwordResultModel;
  final bool lowerCaseIsEnable;
  const GeneratorState({
    this.upperCaseValue = false,
    this.lowerCaseValue = true,
    this.numbersValue = false,
    this.symbolValue = false,
    this.sliderValue = 8,
    this.requestPasswordState = RequestState.loading,
    this.passwordResultModel,
    this.lowerCaseIsEnable = false,
  });
  GeneratorState copyWith(
      {bool? upperCaseValue,
      bool? lowerCaseValue,
      bool? symbolValue,
      bool? numbersValue,
      int? sliderValue,
      bool? lowerCaseIsEnable,
      RequestState? requestPasswordState,
      GeneratorPasswordResultModel? passwordResultModel}) {
    return GeneratorState(
        upperCaseValue: upperCaseValue ?? this.upperCaseValue,
        numbersValue: numbersValue ?? this.numbersValue,
        symbolValue: symbolValue ?? this.symbolValue,
        lowerCaseValue: lowerCaseValue ?? this.lowerCaseValue,
        sliderValue: sliderValue ?? this.sliderValue,
        passwordResultModel: passwordResultModel ?? this.passwordResultModel,
        requestPasswordState: requestPasswordState ?? this.requestPasswordState,
        lowerCaseIsEnable: lowerCaseIsEnable ?? this.lowerCaseIsEnable);
  }

  @override
  List<Object?> get props => [
        upperCaseValue,
        numbersValue,
        symbolValue,
        lowerCaseValue,
        sliderValue,
        passwordResultModel,
        requestPasswordState,
        lowerCaseIsEnable
      ];
}
