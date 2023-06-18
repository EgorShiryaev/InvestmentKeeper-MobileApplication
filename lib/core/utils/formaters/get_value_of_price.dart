double? getValueOfPrice(String? value) {
  if (value == null) {
    return null;
  }
  return double.tryParse(value.split(' ').first);
}
