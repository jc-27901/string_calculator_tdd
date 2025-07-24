class StringCalculator {
  int add(String numbers) {
    // Handle Empty
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String numberSection = numbers;

    //Handle custom delimiter
    if (numbers.startsWith('//')) {
      final delimiterEnd = numbers.indexOf('\n');
      delimiter = numbers.substring(2, delimiterEnd);
      numberSection = numbers.substring(delimiterEnd + 1);
    }

    //Replace newline with delimiter
    numberSection = numberSection.replaceAll('\n', delimiter);

    // Split using the correct delimiter
    List<String> numberList = numberSection.split(delimiter);

    // Convert and sum
    int sum = 0;
    for (String numStr in numberList) {
      if (numStr.isNotEmpty) {
        sum += int.parse(numStr);
      }
    }

    return sum;
  }
}
