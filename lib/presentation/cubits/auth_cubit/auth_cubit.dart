import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/get_error_message.dart';
import '../../../data/datasources/auth_datasource/auth_datasource.dart';
import '../../../data/datasources/login_datasource/login_datasource.dart';
import '../../../domain/entities/auth_data.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthDatasource _authDatasource;
  final LoginDatasource _loginDatasource;

  AuthCubit({
    required AuthDatasource authDatasource,
    required LoginDatasource loginDatasource,
  })  : _loginDatasource = loginDatasource,
        _authDatasource = authDatasource,
        super(InitialAuthState());

  Future<void> autoLogin() async {
    try {
      final data = await _authDatasource.getAuthData();
      if (data == null) {
        emit(UserIsUnauthState());
        return;
      }
      await _loginDatasource.login(
        phoneNumber: data.phoneNumber,
        password: data.password,
      );
      emit(UserIsAuthState());
    } catch (error) {
      final message = getErrorMessage(error);
      emit(ErrorAuthState(message: message));
    }
  }

  Future<void> login(AuthData data) async {
    try {
      await _authDatasource.setAuthData(data);
      emit(UserIsAuthState());
    } catch (error) {
      final message = getErrorMessage(error);
      emit(ErrorAuthState(message: message));
    }
  }

  Future<void> logout() async {
    try {
      await _authDatasource.removeAuthData();
      emit(UserIsUnauthState());
    } catch (error) {
      final message = getErrorMessage(error);
      emit(ErrorAuthState(message: message));
    }
  }
}
