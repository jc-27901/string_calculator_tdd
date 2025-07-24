# String Calculator TDD Kata

This project implements the String Calculator TDD Kata in Dart, following Test-Driven Development principles.

## Features Implemented

### Step 1: Basic Add Method
- ✅ Handles empty string (returns 0)
- ✅ Handles single number
- ✅ Handles two numbers separated by comma


### Step 2: Unknown Amount of Numbers
- ✅ Can handle any number of comma-separated values


### Step 3: Handle New Lines
- ✅ Supports newline (`\n`) as delimiter
- ✅ Mixed comma and newline delimiters


### Step 4: Two Numbers Test
- Add test for two numbers
- Implement splitting and summing


### Step 5: Negative number tests.
- ✅Feat Handle Negative Numbers In the String.


### Step 6: Numbers greater than 1000
- ✅Feat Handle Numbers > 1000 are ignored.


### Step 7: Multi-character delimiter
- ✅Feat Multi-character delimiter.


### Step 8: Multiple delimiters
- ✅Multiple delimiters.


### Step 9: Multiple multi-character delimiters
- ✅Multiple delimiters.

## Project Structure

```
string_calculator_kata/
├── lib/
│   └── string_calculator.dart      # Main implementation
├── test/
│   ├── string_calculator_test.dart # Comprehensive tests
│   └── step_by_step_test.dart     # TDD progression tests
├── pubspec.yaml
└── README.md
```

## Running the Tests

```bash
# Install dependencies
dart pub get

# Run all tests
dart test

# Run tests with coverage
dart test --coverage=coverage

# Run specific test file
dart test test/string_calculator_test.dart
```

## TDD Approach Used

This implementation follows the Red-Green-Refactor cycle:

1. **Red**: Write a failing test
2. **Green**: Write minimal code to make it pass
3. **Refactor**: Improve code while keeping tests green
