import 'dart:io';

void main() {
  print('Welcome to Dart Calculator!');
  bool continueCalculation = true;

  while (continueCalculation) {
    try {
      // Get first number
      stdout.write('Enter the first number: ');
      num num1 = num.parse(stdin.readLineSync()!);

      // Get operation
      stdout.write('Enter an operation (+, -, *, /, %): ');
      String operation = stdin.readLineSync()!;

      // Get second number
      stdout.write('Enter the second number: ');
      num num2 = num.parse(stdin.readLineSync()!);

      // Perform calculation
      num result = performCalculation(num1, num2, operation);
      print('Result: $num1 $operation $num2 = $result');

    } catch (e) {
      print('Error: ${e.toString()}. Please enter valid inputs.');
    }

    // Ask if the user wants to continue
    stdout.write('Do you want to perform another calculation? (yes/no): ');
    String? response = stdin.readLineSync();

    if (response == null || response.toLowerCase() != 'yes') {
      continueCalculation = false;
      print('Thank you for using Dart Calculator. Goodbye!');
    }
  }
}

num performCalculation(num num1, num num2, String operation) {
  switch (operation) {
    case '+':
      return num1 + num2;
    case '-':
      return num1 - num2;
    case '*':
      return num1 * num2;
    case '/':
      if (num2 == 0) {
        throw Exception('Cannot divide by zero');
      }
      return num1 / num2;
    case '%':
      if (num2 == 0) {
        throw Exception('Cannot calculate remainder with zero divisor');
      }
      return num1 % num2;
    default:
      throw Exception('Invalid operation');
  }
}
