import '../../settings/phone_number_format.dart';
import '../../settings/validator_data.dart';

String? phoneNumberFieldValidator(String? value) {
  if (value == null || value.length != PhoneNumberFormat.mask.length) {
    return ValidatorData.empty;
  }
  return null;
}
