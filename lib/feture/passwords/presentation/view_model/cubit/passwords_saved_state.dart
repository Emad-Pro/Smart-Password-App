part of 'passwords_saved_cubit.dart';

class PasswordsSavedState extends Equatable {
  const PasswordsSavedState(
      {this.requestState = RequestState.loading, this.passwordsModel});
  final RequestState requestState;
  final List<PasswordsGenerationModel>? passwordsModel;
  PasswordsSavedState copyWith(
      {RequestState? requestState,
      List<PasswordsGenerationModel>? passwordsModel}) {
    return PasswordsSavedState(
        passwordsModel: passwordsModel ?? this.passwordsModel,
        requestState: requestState ?? this.requestState);
  }

  @override
  List<Object?> get props => [passwordsModel, passwordsModel];
}
