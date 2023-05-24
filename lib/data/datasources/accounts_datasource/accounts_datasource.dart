import '../../../domain/entities/account_entity.dart';

abstract class AccountsDatasource {
  Future<List<AccountEntity>> getAll();
  Future<AccountEntity> get(int id);
}
