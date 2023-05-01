import '../../settings/validator_data.dart';

String? confirmPasswordValidator({
  String? confirmPassword,
  required String password,
}) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return ValidatorData.empty;
  } else if (password != confirmPassword) {
    return ValidatorData.passwordsNotEquals;
  }
  return null;
}
