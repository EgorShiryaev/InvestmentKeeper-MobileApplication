import '../../settings/validator_data.dart';

String? numberValidator(String? value) {
  final intValue = int.tryParse(value!);
  if (intValue == 0){
     return ValidatorData.notBeZero;
  }
  return null;
}
