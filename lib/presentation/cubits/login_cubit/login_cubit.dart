import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/exceptions/exception_impl.dart';
import '../../../core/exceptions/failed_auth_exception.dart';
import '../../../data/datasources/login_datasource/login_datasource.dart';
import '../../pages/home_page.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginDatasource datasource;
  LoginCubit({
    required this.datasource,
  }) : super(InitialLoginState());

  Future<void> login({
    required String phoneNumber,
    required String password,
  }) async {
    emit(LoadingLoginState());
    await datasource
        .login(phoneNumber: phoneNumber, password: password)
        .then((user) {
      Get.offAllNamed(HomePage.routeName);
      emit(SuccessLoginState());
    }).catchError((error) {
      if (error is FailedAuthException) {
        emit(FailureLoginState(message: error.message));
      } else {
        final message =
            error is ExceptionImpl ? error.message : error.toString();
        emit(ErrorLoginState(message: message));
      }
    });
  }
}
