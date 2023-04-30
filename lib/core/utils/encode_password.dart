import 'dart:convert';

String encodePassword(String password) {
  final bytes = utf8.encode(password);
  return base64.encode(bytes);
}
