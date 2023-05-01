import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/exceptions/exception_impl.dart';
import '../../../data/datasources/registration_datasource/registration_datasource.dart';
import '../../pages/home_page.dart';
import 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final RegistrationDatasource datasource;
  RegistrationCubit({
    required this.datasource,
  }) : super(InitialRegistrationState());

  Future<void> registration({
    required String phoneNumber,
    required String password,
    required String name,
  }) async {
    try {
      emit(LoadingRegistrationState());
      await datasource.registration(
        phoneNumber: phoneNumber,
        password: password,
        name: name,
      );
      await Get.offAllNamed(HomePage.routeName);
      emit(SuccessRegistrationState());
    } catch (error) {
      final message = error is ExceptionImpl ? error.message : error.toString();
      if (message == 'User is already exists') {
        emit(UserIsAlreadyExistsRegistrationState());
      } else {
        emit(ErrorRegistrationState(message: message));
      }
    }
  }
}
