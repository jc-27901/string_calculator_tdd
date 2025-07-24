class StringCalculator {
  int add(String numbers) {
    // Step 1: Handle empty string
    if (numbers.isEmpty) {
      return 0;
    }

    // Split by comma to handle both single number and two numbers
    List<String> numberList = numbers.split(',');

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