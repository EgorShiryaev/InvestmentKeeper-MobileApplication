import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  static String routeName = '/registration';
  
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Registration page'),
      ),
    );
  }
}
