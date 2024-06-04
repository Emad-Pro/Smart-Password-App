import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_password/core/database/model/isar_database.dart';
import 'package:smart_password/core/enum/request_state.dart';

import '../../../../../core/database/model/password_generation_model.dart';

part 'passwords_saved_state.dart';

class PasswordsSavedCubit extends Cubit<PasswordsSavedState> {
  PasswordsSavedCubit() : super(PasswordsSavedState());
  getPasswordsData() async {
    final result = await IsarDatabase().getData();
    emit(state.copyWith(
        requestState: RequestState.success, passwordsModel: result));
  }
}
