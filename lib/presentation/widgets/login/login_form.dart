import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../core/utils/validators/password_validator.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import '../../cubits/login_cubit/login_state.dart';
import '../../pages/arguments/login_page_arguments.dart';
import '../../themes/app_theme.dart';

class LoginForm extends HookWidget {
  const LoginForm({super.key});

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
    final passwordVisibilityState = useState(false);

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
                  autofocus: true,
                  obscureText: !passwordVisibilityState.value,
                  controller: controller,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'\S+')),
                  ],
                  validator: passwordValidator,
                  onFieldSubmitted: (_) => submit(),
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    errorMaxLines: 2,
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisibilityState.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        changePasswordVisibility(passwordVisibilityState);
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
