class GeneratorPasswordGetModel {
  final bool? upperCase;
  final bool? lowerCase;
  final bool? numbers;
  final bool? symbol;
  final int? lengthPassword;
  GeneratorPasswordGetModel(
      {this.upperCase,
      this.lowerCase,
      this.numbers,
      this.symbol,
      this.lengthPassword});
}
