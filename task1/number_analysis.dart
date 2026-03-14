// dart-fundamentals-assignment/task1/number_analysis.dart

void main() {
  // Test cases
  analyzeNumbers([4, -2, 7, 0, 3, -5, 12, 8, -1, 6]);
  analyzeNumbers([10]);
  analyzeNumbers([]);
  analyzeNumbers([5, 5, 5, 5]);
  analyzeNumbers([-3, -7, -1, -9, -2]);
}

/// Analyzes a list of integers and prints various statistics
void analyzeNumbers(List<int> numbers) {
  if (numbers.isEmpty) {
    print('The list is empty.');
    return;
  }

  int countPositive = 0;
  int countNegative = 0;
  int countZero = 0;
  int sum = 0;
  int min = numbers[0];
  int max = numbers[0];

  for (int num in numbers) {
    sum += num;

    if (num > 0) {
      countPositive++;
    } else if (num < 0) {
      countNegative++;
    } else {
      countZero++;
    }

    if (num < min) min = num;
    if (num > max) max = num;
  }

  double average = sum / numbers.length;

  print('List: $numbers');
  print('Total numbers: ${numbers.length}');
  print('Positive numbers: $countPositive');
  print('Negative numbers: $countNegative');
  print('Zeros: $countZero');
  print('Sum: $sum');
  print('Average: ${average.toStringAsFixed(2)}');
  print('Minimum: $min');
  print('Maximum: $max');

  // Bonus-friendly extra observations
  if (countPositive > countNegative + countZero) {
    print('→ The list is mostly positive');
  } else if (countNegative > countPositive + countZero) {
    print('→ The list is mostly negative');
  }

  if ((max - min) > 20) {
    print('→ Large range detected (${max - min})');
  }

  print('---');
}
