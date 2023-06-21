import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

import '../../../core/utils/get_error_message.dart';
import '../../../data/datasources/is_user_datasource/is_user_datasource.dart';
import '../../pages/arguments/login_page_arguments.dart';
import '../../pages/arguments/registration_page_arguments.dart';
import '../../pages/login_page.dart';
import '../../pages/registration_page.dart';
import 'check_is_user_exists_state.dart';

class CheckIsUserExistsCubit extends Cubit<CheckIsUserExistsState> {
  final IsUserDatasource _datasource;
  CheckIsUserExistsCubit({
    required IsUserDatasource datasource,
  })  : _datasource = datasource,
        super(InitialCheckIsUserExistsState());

  Future<void> check(String phoneNumber) async {
    try {
      emit(LoadingCheckIsUserExistsState());
      final value = await _datasource.get(phoneNumber);
      if (value) {
        final args = LoginPageArguments(phoneNumber: phoneNumber);
        await Get.toNamed(LoginPage.routeName, arguments: args);
        emit(SuccessCheckIsUserExistsState());
      } else {
        final args = RegistrationPageArguments(phoneNumber: phoneNumber);
        await Get.toNamed(RegistrationPage.routeName, arguments: args);
        emit(FailureCheckIsUserExistsState());
      }
    } catch (error) {
      final message = getErrorMessage(error);
      emit(ErrorCheckIsUserExistsState(message: message));
    }
  }
}
