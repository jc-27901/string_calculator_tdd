import 'package:test/test.dart';
import '../lib/string_calculator.dart';

void main() {
  group('String Calculator Tests', () {
    late StringCalculator calculator;

    setUp(() {
      calculator = StringCalculator();
    });

    // Step 1 Tests: Basic functionality
    group('Step 1: Basic Add functionality', () {
      test('should return 0 for empty string', () {
        expect(calculator.add(''), equals(0));
      });

      test('should return the number itself for single number', () {
        expect(calculator.add('1'), equals(1));
        expect(calculator.add('5'), equals(5));
      });

      test('should return sum for two numbers', () {
        expect(calculator.add('1,2'), equals(3));
        expect(calculator.add('3,4'), equals(7));
      });
    });

    // Step 2 Tests: Unknown amount of numbers
    group('Step 2: Handle unknown amount of numbers', () {
      test('should handle multiple numbers', () {
        expect(calculator.add('1,2,3'), equals(6));
        expect(calculator.add('1,2,3,4,5'), equals(15));
        expect(calculator.add('10,20,30,40'), equals(100));
      });
    });

    // Step 3 Tests: Handle New Lines delimiter
    test('Step 3: Handle newline delimiter', () {
      expect(calculator.add('1\n2,3'), equals(6));
    });

    // Step 4 Tests: Handle Custom delimiter
    test('Step 4: Custom delimiter', () {
      expect(calculator.add('//;\n1;2'), equals(3));
    });
    // Step 5 Tests: Single negative throws exception
    test('Step 5a: Single negative throws exception', () {
      expect(() => calculator.add('-1'), throwsArgumentError);
    });
    // Step 5 Tests: Multiple negatives in exception message
    test('Step 5b: Multiple negatives in exception message', () {
      expect(
        () => calculator.add('1,-2,-3'),
        throwsA(
          predicate(
            (e) =>
                e is ArgumentError &&
                e.message.contains('-2') &&
                e.message.contains('-3'),
          ),
        ),
      );
    });

    // Step 6 Tests: Numbers > 1000 are ignored
    test('Step 6a: Numbers > 1000 are ignored', () {
      expect(calculator.add('2,1001'), equals(2));
    });
    // Step 7 Tests: Multi-character delimiter
    test('Step 7: Multi-character delimiter', () {
      expect(calculator.add('//[***]\n1***2***3'), equals(6));
    });
    // Step 8 Multiple delimiters
    test('Step 8: Multiple delimiters', () {
      expect(calculator.add('//[*][%]\n1*2%3'), equals(6));
    });
    // Step 9 Multiple multi-character delimiters
    test('Step 9: Multiple multi-character delimiters', () {
      expect(calculator.add('//[***][%%%]\n1***2%%%3'), equals(6));
    });
  });
}
