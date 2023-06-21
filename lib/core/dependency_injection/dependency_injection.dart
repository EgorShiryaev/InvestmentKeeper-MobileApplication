import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../settings/app_settings.dart';
import 'account_cubit_di.dart';
import 'auth_cubit_di.dart';
import 'candles_cubit_di.dart';
import 'check_is_user_exists_di.dart';
import 'create_account_cubit_di.dart';
import 'create_purchase_cubit_di.dart';
import 'create_refill_cubit_di.dart';
import 'create_sale_cubit_di.dart';
import 'create_withdrawal_cubit_di.dart';
import 'edit_account_cubit_di.dart';
import 'login_di.dart';
import 'registration_di.dart';
import 'search_instrument_cubit_di.dart';
import 'user_accounts_cubit_di.dart';

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
  candlesCubitDependencyInjection();
}
