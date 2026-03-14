// dart-fundamentals-assignment/task2/calculator_app.dart

import 'dart:async';

void main() async {
  final calc = Calculator();

  print('=== Async Calculator Demo ===\n');

  try {
    print('10 + 5     → ${await calc.add(10, 5)}');
    print('20 - 8     → ${await calc.subtract(20, 8)}');
    print('7 * 6      → ${await calc.multiply(7, 6)}');
    
    // This will throw exception
    // print('15 / 0     → ${await calc.divide(15, 0)}');

    print('100 / 4    → ${await calc.divide(100, 4)}');
    
    // Chained async operations (shows async usefulness)
    print('\nChained calculation:');
    var result = await calc.add(20, 5);
    result = await calc.multiply(result, 3);
    result = await calc.subtract(result, 10);
    print('((20 + 5) × 3) - 10 = $result');

    // Demonstrate delay simulation (e.g. expensive calculation)
    print('\nSimulating long calculation...');
    final longResult = await calc.powerWithDelay(2, 10);
    print('2¹⁰ = $longResult');

  } on DivisionByZeroException catch (e) {
    print('Error: ${e.message}');
  } on Exception catch (e) {
    print('Unexpected error: $e');
  }

  print('\nCalculator session ended.');
}

/// Custom exception for division by zero
class DivisionByZeroException implements Exception {
  final String message;
  DivisionByZeroException([this.message = 'Division by zero is not allowed']);
}

/// Simple scientific calculator with async methods
class Calculator {
  /// Adds two numbers with artificial delay
  Future<double> add(double a, double b) async {
    await Future.delayed(Duration(milliseconds: 300));
    return a + b;
  }

  /// Subtracts b from a
  Future<double> subtract(double a, double b) async {
    await Future.delayed(Duration(milliseconds: 200));
    return a - b;
  }

  /// Multiplies two numbers
  Future<double> multiply(double a, double b) async {
    await Future.delayed(Duration(milliseconds: 250));
    return a * b;
  }

  /// Divides a by b – throws custom exception on zero
  Future<double> divide(double a, double b) async {
    if (b == 0) {
      throw DivisionByZeroException();
    }
    await Future.delayed(Duration(milliseconds: 400));
    return a / b;
  }

  /// Bonus: power function with longer simulated computation
  Future<num> powerWithDelay(num base, int exponent) async {
    if (exponent < 0) {
      throw Exception('Negative exponents not supported in this demo');
    }

    num result = 1;
    for (int i = 0; i < exponent; i++) {
      result *= base;
      // Simulate longer computation for bigger exponents
      await Future.delayed(Duration(milliseconds: 150));
    }
    return result;
  }
  }
