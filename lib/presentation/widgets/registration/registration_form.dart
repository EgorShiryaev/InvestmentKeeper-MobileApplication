import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../core/utils/validators/confirm_password_validator.dart';
import '../../../core/utils/validators/empty_value_validar.dart';
import '../../../core/utils/validators/password_validator.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import '../../pages/arguments/login_page_arguments.dart';
import '../../themes/app_theme.dart';

class RegistrationForm extends HookWidget {
  const RegistrationForm({super.key});

  void clearController(TextEditingController controller) {
    controller.text = '';
  }

  void changeVisibility(ValueNotifier<bool> visibility) {
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

    final nameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final nameFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();
    final confirmPasswordFocusNode = useFocusNode();

    final formKey = useRef(GlobalKey<FormState>()).value;

    final passwordVisibilityState = useState(false);
    final confirmPasswordVisibilityState = useState(false);

    final submit = useCallback(() {
      submitForm(context, formKey: formKey, password: nameController.text);
      // ignore: require_trailing_commas
    }, [nameController]);

    return SliverSafeArea(
      top: false,
      bottom: false,
      minimum: AppTheme.pagePadding,
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Text('Чтобы зарегистрироваться', style: textStyle),
            const SizedBox(height: 10),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    focusNode: nameFocusNode,
                    textInputAction: TextInputAction.next,
                    validator: emptyValueValidator,
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                      labelText: 'Имя',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.cancel_outlined),
                        onPressed: () => clearController(nameController),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: !passwordVisibilityState.value,
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('\S+')),
                    ],
                    validator: passwordValidator,
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
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
                          changeVisibility(passwordVisibilityState);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: !confirmPasswordVisibilityState.value,
                    controller: confirmPasswordController,
                    focusNode: confirmPasswordFocusNode,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('\S+')),
                    ],
                    validator: (value) => confirmPasswordValidator(
                      password: passwordController.text,
                      confirmPassword: value,
                    ),
                    onFieldSubmitted: (_) => submit(),
                    decoration: InputDecoration(
                      labelText: 'Подтвердить',
                      suffixIcon: IconButton(
                        icon: Icon(
                          confirmPasswordVisibilityState.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          changeVisibility(confirmPasswordVisibilityState);
                        },
                      ),
                    ),
                  ),
                ],
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
    );

    // BlocListener<LoginCubit, LoginState>(
    //   listener: (context, state) {
    //     if (state is SuccessLoginState || state is FailureLoginState) {
    //       controller.text = '';
    //     }
    //   },
    //   child:  );
  }
}
