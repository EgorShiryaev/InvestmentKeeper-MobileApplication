import '../../settings/validator_data.dart';

String? priceValidator(String? value) {
  if (value == null || value.isEmpty) {
    return ValidatorData.empty;
  } else if (value.trim().isEmpty) {
    return ValidatorData.trimmedValueIsEmpty;
  } else {
    final price = value.split(' ')[0];
    final lastCharPrice = price.split('')[price.length - 1];
    if (lastCharPrice == '.') {
      return ValidatorData.lastCharPriceIsPoint;
    }
  }
  return null;
}
