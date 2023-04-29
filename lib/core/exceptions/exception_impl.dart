class ExceptionImpl implements Exception {
  final String _message;

  ExceptionImpl({required String message}) : _message = message;

  String get message => _message;
}
