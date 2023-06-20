import '../../../domain/entities/account.dart';

abstract class AccountsDatasource {
  Future<List<Account>> getAll();
  Future<Account> get(int id);
  Future<void> create({required String title});
  Future<void> edit({required int id, required String title});
}
