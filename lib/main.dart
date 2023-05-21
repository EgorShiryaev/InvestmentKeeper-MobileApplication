import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'app.dart';
import 'core/dependency_injection/dependency_injection.dart';
import 'presentation/cubits/auth_cubit/auth_cubit.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  dependencyInjection();
  final userIsAuth = await Get.find<AuthCubit>().autoLogin();
  FlutterNativeSplash.remove();
  runApp(App(userIsAuth: userIsAuth));
}
