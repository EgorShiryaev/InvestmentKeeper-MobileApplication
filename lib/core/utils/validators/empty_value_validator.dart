import '../../settings/validator_data.dart';

String? emptyValueValidator(String? value) {
  if (value == null || value.isEmpty) {
    return ValidatorData.empty;
  } else if (value.trim().isEmpty) {
    return ValidatorData.trimmedValueIsEmpty;
  }
  return null;
}
