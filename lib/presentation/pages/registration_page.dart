import 'package:flutter/material.dart';

import '../widgets/registration/registration_app_bar.dart';
import '../widgets/registration/registration_form.dart';

class RegistrationPage extends StatelessWidget {
  static String routeName = '/registration';

  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          RegistrationAppBar(),
          RegistrationForm(),
        ],
      ),
    );
  }
}
