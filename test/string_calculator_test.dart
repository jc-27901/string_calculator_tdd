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
  });
}
