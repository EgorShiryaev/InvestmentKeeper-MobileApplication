import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/exceptions/exception_impl.dart';
import '../../../data/datasources/registration_datasource/registration_datasource.dart';
import '../../../domain/entities/auth_data.dart';
import 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final RegistrationDatasource _datasource;
  RegistrationCubit({
    required RegistrationDatasource datasource,
  })  : _datasource = datasource,
        super(InitialRegistrationState());

  Future<void> registration({
    required String phoneNumber,
    required String password,
    required String name,
  }) async {
    try {
      emit(LoadingRegistrationState());
      await _datasource.registration(
        phoneNumber: phoneNumber,
        password: password,
        name: name,
      );
      final authData = AuthData(phoneNumber: phoneNumber, password: password);
      emit(SuccessRegistrationState(data: authData));
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
