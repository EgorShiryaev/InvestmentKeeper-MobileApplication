import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

import '../../../core/exceptions/exception_impl.dart';
import '../../../data/datasources/is_user_datasource/is_user_datasource.dart';
import '../../pages/arguments/login_page_arguments.dart';
import '../../pages/login_page.dart';
import '../../pages/registration_page.dart';
import 'check_is_user_exists_state.dart';

class CheckIsUserExistsCubit extends Cubit<CheckIsUserExistsState> {
  final IsUserDatasource datasource;
  CheckIsUserExistsCubit({
    required this.datasource,
  }) : super(InitialCheckIsUserExistsState());

  Future<void> check(String phoneNumber) async {
    emit(LoadingCheckIsUserExistsState());
    await datasource.get(phoneNumber).then((value) {
      if (value) {
        final args = LoginPageArguments(phoneNumber: phoneNumber);
        Get.toNamed(LoginPage.routeName, arguments: args);
        emit(SuccessCheckIsUserExistsState());
      } else {
        Get.toNamed(RegistrationPage.routeName);
        emit(FailureCheckIsUserExistsState());
      }
    }).catchError((error) {
      final message = error is ExceptionImpl ? error.message : error.toString();
      emit(ErrorCheckIsUserExistsState(message: message));
    });
  }
}
