import '../../settings/password_format.dart';
import '../../settings/validator_data.dart';
import 'check_all_characters_to_regex.dart';


String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return ValidatorData.empty;
  } else if (value.length < PasswordFormat.minPasswordLength) {
    return ValidatorData.passwordShouldBeLargeSevenChars;
  } else if (!checkAllCharactersToRegex(value, PasswordFormat.regEx)) {
    return ValidatorData.passwordShouldBeChars;
  }
  return null;
}
