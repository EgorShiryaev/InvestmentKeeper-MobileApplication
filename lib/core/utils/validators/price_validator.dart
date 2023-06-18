import '../../settings/validator_data.dart';
import '../formaters/get_value_of_price.dart';

String? priceValidator(String? value) {
  if (value == null || value.isEmpty) {
    return ValidatorData.empty;
  } else if (value.trim().isEmpty) {
    return ValidatorData.trimmedValueIsEmpty;
  } else {
    final price = getValueOfPrice(value);
    if (price == 0) {
      return ValidatorData.notBeZero;
    }
  }
  return null;
}
