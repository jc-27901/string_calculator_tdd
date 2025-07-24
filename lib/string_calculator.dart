class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String numberSection = numbers;

    // Handle custom delimiter
    if (numbers.startsWith('//')) {
      final delimiterEnd = numbers.indexOf('\n');
      delimiter = numbers.substring(2, delimiterEnd);
      numberSection = numbers.substring(delimiterEnd + 1);
    }

    // Replace newline with delimiter
    numberSection = numberSection.replaceAll('\n', delimiter);

    // Split using the correct delimiter
    List<String> numberList = numberSection.split(delimiter);

    int sum = 0;
    List<int> negativeNumbers = [];

    for (String numStr in numberList) {
      if (numStr.isNotEmpty) {
        int number = int.parse(numStr);

        // Collect negative numbers
        if (number < 0) {
          negativeNumbers.add(number);
        }

        // Step 6: Ignore numbers > 1000
        if (number <= 1000) {
          sum += number;
        }
      }
    }

    // Throw exception if any negative numbers found
    if (negativeNumbers.isNotEmpty) {
      throw ArgumentError('Negatives not allowed: ${negativeNumbers.join(', ')}');
    }

    return sum;
  }
}
