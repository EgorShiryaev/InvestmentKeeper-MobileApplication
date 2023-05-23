import '../../../domain/entities/account.dart';

abstract class AccountsDatasource {
  Future<List<Account>> getAll();
}
