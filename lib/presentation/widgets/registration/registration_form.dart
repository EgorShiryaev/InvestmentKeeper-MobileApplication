import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../core/utils/modals_utils/show_error_snackbar.dart';
import '../../../core/utils/validators/confirm_password_validator.dart';
import '../../../core/utils/validators/empty_value_validator.dart';
import '../../../core/utils/validators/password_validator.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../cubits/registration_cubit/registration_cubit.dart';
import '../../cubits/registration_cubit/registration_state.dart';
import '../../pages/arguments/registration_page_arguments.dart';
import '../space_between_form_items.dart';

class RegistrationForm extends HookWidget {
  const RegistrationForm({super.key});

  void changeVisibility(ValueNotifier<bool> visibility) {
    visibility.value = !visibility.value;
  }

  void submitForm(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
    required String name,
    required String password,
  }) {
    if (formKey.currentState?.validate() ?? false) {
      final args = Get.arguments as RegistrationPageArguments;
      FocusScope.of(context).unfocus();
      Get.find<RegistrationCubit>().registration(
        phoneNumber: args.phoneNumber,
        password: password,
        name: name,
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
      submitForm(
        context,
        formKey: formKey,
        name: nameController.text,
        password: passwordController.text,
      );
      // ignore: require_trailing_commas
    }, [nameController]);

    return BlocListener<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        if (state is SuccessRegistrationState) {
          BlocProvider.of<AuthCubit>(context).login(state.data);
        } else if (state is ErrorRegistrationState) {
          showErrorSnackbar(state.message);
        } else if (state is UserIsAlreadyExistsRegistrationState) {
          Get.snackbar(
            'Проверьте введенные данные',
            'Пользователь с таким номером телефона уже существует',
          );
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Чтобы зарегистрироваться', style: textStyle),
            const SizedBox(height: 10),
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
                  onPressed: () => nameController.text = '',
                ),
              ),
            ),
            const SpaceBetweenFormItems(),
            TextFormField(
              obscureText: !passwordVisibilityState.value,
              controller: passwordController,
              focusNode: passwordFocusNode,
              textInputAction: TextInputAction.next,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'\S+')),
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
            const SpaceBetweenFormItems(),
            TextFormField(
              obscureText: !confirmPasswordVisibilityState.value,
              controller: confirmPasswordController,
              focusNode: confirmPasswordFocusNode,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'\S+')),
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
            const SpaceBetweenFormItems(),
            FilledButton(
              onPressed: submit,
              child: const Text('Продолжить'),
            ),
          ],
        ),
      ),
    );
  }
}
