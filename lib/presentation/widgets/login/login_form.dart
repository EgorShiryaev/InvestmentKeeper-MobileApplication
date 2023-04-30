import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../core/settings/password_format.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import '../../cubits/login_cubit/login_state.dart';
import '../../pages/arguments/login_page_arguments.dart';
import '../../themes/app_theme.dart';

class LoginForm extends HookWidget {
  const LoginForm({super.key});

  String? passwordFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Заполните поле';
    } else if (value.length < PasswordFormat.minPasswordLength) {
      return 'Пароль должен быть больше 7 символов';
    }
    return null;
  }

  void changePasswordVisibility(ValueNotifier<bool> visibility) {
    visibility.value = !visibility.value;
  }

  void submitForm(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
    required String password,
  }) {
    if (formKey.currentState?.validate() ?? false) {
      final args = Get.arguments as LoginPageArguments;
      FocusScope.of(context).unfocus();
      BlocProvider.of<LoginCubit>(context).login(
        phoneNumber: args.phoneNumber,
        password: password,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.outline;
    final textStyle =
        Theme.of(context).textTheme.bodyLarge?.copyWith(color: textColor);

    final controller = useTextEditingController();
    final formKey = useRef(GlobalKey<FormState>()).value;
    final passwordIsHiddedState = useState(true);

    final submit = useCallback(() {
      submitForm(context, formKey: formKey, password: controller.text);
      // ignore: require_trailing_commas
    }, [controller]);

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is SuccessLoginState || state is FailureLoginState) {
          controller.text = '';
        }
      },
      child: SliverSafeArea(
        top: false,
        bottom: false,
        minimum: AppTheme.pagePadding,
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            [
              Text('Чтобы войти', style: textStyle),
              const SizedBox(height: 10),
              Form(
                key: formKey,
                child: TextFormField(
                  obscureText: passwordIsHiddedState.value,
                  controller: controller,
                  validator: passwordFieldValidator,
                  onFieldSubmitted: (_) => submit(),
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordIsHiddedState.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        changePasswordVisibility(passwordIsHiddedState);
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: submit,
                child: const Text('Продолжить'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
