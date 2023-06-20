String? removeCurrencyChar(String? value) {
  if (value == null) {
    return null;
  }
  return value.split(' ').first;
}
