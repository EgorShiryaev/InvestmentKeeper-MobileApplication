import 'package:get/get.dart';

import '../../data/datasources/withdrawals_datasource/withdrawals_datasource.dart';
import '../../data/datasources/withdrawals_datasource/withdrawals_remote_datasource.dart';
import '../../presentation/cubits/create_withdrawal_cubit/create_withdrawal_cubit.dart';

void createWithdrawalCubitDependencyInjection() {
  Get
    ..create<WithdrawalsDatasource>(
      () => WithdrawalsRemoteDatasource(requestManager: Get.find()),
    )
    ..lazyPut(
      () => CreateWithdrawalCubit(datasource: Get.find()),
      fenix: true,
    );
}
