
bool checkAllCharactersToRegex(String stroke, RegExp regExp) {
  final matches = regExp.allMatches(stroke);

  return matches.length == stroke.length;
}
