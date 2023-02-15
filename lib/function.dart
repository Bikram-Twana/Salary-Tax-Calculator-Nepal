import 'dart:io';

void main() {
  print("Enter you Yearly Income:");
  double? yearly_Income = double.parse(stdin.readLineSync()!);
  double? tax_Income = CalculateTax(yearly_Income);
  print("Your total tax amount is $tax_Income");
}

double CalculateTax(double amount) {
  late double final_amount;
  if (amount <= 500000 && amount > 0) {
    final_amount = 0.01 * amount;
    return final_amount;
  } else if (amount > 500000 && amount <= 700000) {
    final_amount = (0.1 * (amount - 500000)) + 5000;
    return final_amount;
  } else if (amount > 700000 && amount <= 1000000) {
    final_amount = (0.2 * (amount - 700000)) + 5000 + 20000;
    return final_amount;
  } else if (amount > 1000000 && amount <= 2000000) {
    final_amount = (0.3 * (amount - 1000000)) + 5000 + 20000 + 60000;
    return final_amount;
  } else if (amount > 2000000) {
    final_amount = (0.36 * (amount - 2000000)) + 5000 + 20000 + 60000 + 300000;
    return final_amount;
  } else {
    throw Exception("Enter a valid amount");
  }
}
