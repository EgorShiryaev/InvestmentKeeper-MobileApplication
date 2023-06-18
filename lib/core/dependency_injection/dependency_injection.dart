import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../settings/app_settings.dart';
import 'account_cubit_dependency_injection.dart';
import 'auth_cubit_dependency_injection.dart';
import 'check_is_user_exists_dependency_injection.dart';
import 'create_account_cubit_dependency_injection.dart';
import 'create_purchase_cubit_dependency_injection.dart';
import 'create_refill_cubit_dependency_injection.dart';
import 'create_sale_cubit_dependency_injection.dart';
import 'create_withdrawal_cubit_dependency_injection.dart';
import 'edit_account_cubit_dependency_injection.dart';
import 'login_dependency_injection.dart';
import 'registration_dependency_injection.dart';
import 'search_instrument_cubit_dependency_injection.dart';
import 'user_accounts_cubit_dependency_injection.dart';

void dependencyInjection() {
  Get.create(() => Dio(AppSettings.dioBaseOprions));
  checkIsUserExistsDependencyInjection();
  loginDependencyInjection();
  registrationDependencyInjection();
  authCubitDependencyInjection();
  userAccountsCubitDependencyInjection();
  accountCubitDependencyInjection();
  createAccountCubitDependencyInjection();
  editAccountCubitDependencyInjection();
  createPurchaseCubitDependencyInjection();
  createSaleCubitDependencyInjection();
  createRefillCubitDependencyInjection();
  createWithdrawalCubitDependencyInjection();
  searchInstrumentCubitDependencyInjection();
}
