import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/exceptions/base/failed_auth_exception.dart';
import '../../../core/utils/get_error_message.dart';
import '../../../data/datasources/login_datasource/login_datasource.dart';
import '../../../domain/entities/auth_data.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginDatasource _datasource;
  LoginCubit({
    required LoginDatasource datasource,
  })  : _datasource = datasource,
        super(InitialLoginState());

  Future<void> login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      emit(LoadingLoginState());
      await _datasource.login(phoneNumber: phoneNumber, password: password);
      final authData = AuthData(phoneNumber: phoneNumber, password: password);
      emit(SuccessLoginState(data: authData));
    } catch (error) {
      if (error is FailedAuthException) {
        emit(FailureLoginState());
        return;
      }
      final message = getErrorMessage(error);
      emit(ErrorLoginState(message: message));
    }
  }
}
