import 'dart:io';

void main() {
  print("=== Простой калькулятор ===\n");

  double num1 = askNumber("Введите первое число: ");
  double num2 = askNumber("Введите второе число: ");
  String? op = askOperation();

  double? result = calculate(num1, num2, op);

  if (result != null) {
    print("\nРезультат: $num1 $op $num2 = $result");
  } else {
    print("Ошибка операции!");
  }
}

// Запрашивает число, пока не получит валидное
double askNumber(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    double? number = double.tryParse(input ?? '');
    if (number != null) return number;
    print("Это не число, попробуй ещё раз.");
  }
}

// Запрашивает операцию
String? askOperation() {
  while (true) {
    stdout.write("Выбери операцию (+ − * /): ");
    String? op = stdin.readLineSync()?.trim();
    if (op == '+' || op == '-' || op == '*' || op == '/') {
      return op;
    }
    print("Неправильная операция!");
  }
}

// Сам калькулятор (можно добавить свои операции)
double? calculate(double a, double b, String? op) {
  switch (op) {
    case '+':
      return a + b;
    case '-':
      return a - b;
    case '*':
      return a * b;
    case '/':
      if (b == 0) {
        print("На ноль делить нельзя!");
        return null;
      }
      return a / b;
    default:
      return null;
  }
}