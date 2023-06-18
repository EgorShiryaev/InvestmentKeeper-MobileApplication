String addPrefixZero(int number) {
  if (number < 10) {
    return '0$number';
  }
  return number.toString();
}
