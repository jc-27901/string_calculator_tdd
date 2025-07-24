class StringCalculator {
  int add(String numbers) {
    // Handle empty string
    if (numbers.isEmpty) {
      return 0;
    }

    // Check for custom delimiter
    String delimiter = ',';
    String numbersToProcess = numbers;
    List<String> delimiters = [','];

    if (numbers.startsWith('//')) {
      var parts = numbers.split('\n');
      var delimiterLine = parts[0].substring(2);
      numbersToProcess = parts.sublist(1).join('\n');

      // Handle multiple delimiters with any length
      if (delimiterLine.startsWith('[') && delimiterLine.endsWith(']')) {
        delimiters = _parseMultipleDelimiters(delimiterLine);
      } else {
        // Single character delimiter
        delimiter = delimiterLine;
        delimiters = [delimiter];
      }
    }

    // Replace newlines with commas for easier processing
    numbersToProcess = numbersToProcess.replaceAll('\n', ',');

    // Replace all custom delimiters with commas
    for (String delim in delimiters) {
      if (delim != ',') {
        numbersToProcess = numbersToProcess.replaceAll(delim, ',');
      }
    }

    // Split by comma and convert to integers
    List<String> numberStrings = numbersToProcess.split(',');
    List<int> nums = [];

    for (String numStr in numberStrings) {
      if (numStr.isNotEmpty) {
        int num = int.parse(numStr);
        nums.add(num);
      }
    }

    // Check for negative numbers
    List<int> negatives = nums.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw ArgumentError('negatives not allowed: ${negatives.join(', ')}');
    }

    // Ignore numbers bigger than 1000
    nums = nums.where((n) => n <= 1000).toList();

    // Sum all numbers (handles unknown amount)
    return nums.fold(0, (sum, num) => sum + num);
  }

  // Helper method to parse multiple delimiters
  List<String> _parseMultipleDelimiters(String delimiterLine) {
    List<String> delimiters = [];
    int i = 0;

    while (i < delimiterLine.length) {
      if (delimiterLine[i] == '[') {
        int endIndex = delimiterLine.indexOf(']', i);
        if (endIndex != -1) {
          String delimiter = delimiterLine.substring(i + 1, endIndex);
          delimiters.add(delimiter);
          i = endIndex + 1;
        } else {
          i++;
        }
      } else {
        i++;
      }
    }

    return delimiters;
  }
}
