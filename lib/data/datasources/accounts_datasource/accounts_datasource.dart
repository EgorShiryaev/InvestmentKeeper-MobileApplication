import '../../../domain/entities/account_entity.dart';

abstract class AccountsDatasource {
  Future<List<AccountEntity>> getAll();
  Future<AccountEntity> get(int id);
  Future<void> create({required String title});
  Future<void> edit({required int id, required String title});
}
