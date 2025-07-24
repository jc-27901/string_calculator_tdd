class StringCalculator {
  int add(String numbers) {
    // Handle empty string
    if (numbers.isEmpty) {
      return 0;
    }

    // Replace newlines with commas for easier processing
    String processedNumbers = numbers.replaceAll('\n', ',');

    // Split by comma to handle single, two, or multiple numbers
    List<String> numberList = processedNumbers.split(',');

    // Convert strings to integers and sum them
    int sum = 0;
    for (String numStr in numberList) {
      if (numStr.isNotEmpty) {
        sum += int.parse(numStr);
      }
    }

    return sum;
  }
}