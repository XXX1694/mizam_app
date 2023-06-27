String divideNumberWithSpace(int number) {
  String numberString = number.toString();
  int length = numberString.length;

  if (length <= 3) {
    return numberString;
  }

  String result = '';
  int groups = (length / 3).ceil();
  int startIndex = length % 3;

  if (startIndex == 0) {
    startIndex = 3;
  }

  result += numberString.substring(0, startIndex);

  for (int i = 0; i < groups - 1; i++) {
    int startIndex = (i * 3) + result.length;
    int endIndex = startIndex + 3;
    result += ' ${numberString.substring(startIndex, endIndex)}';
  }

  return result;
}
