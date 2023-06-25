import 'dart:io';

import 'package:dio/dio.dart';

import '../../domain/entities/user.dart';

class AppSettings {
  static final dioBaseOprions = BaseOptions(
    baseUrl: 'http://127.0.0.1:80',
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
  );

  static User? currentUser;

  static const apiVersionV1 = '/api/v1';

  static bool splashScreenVisible = true;
}
