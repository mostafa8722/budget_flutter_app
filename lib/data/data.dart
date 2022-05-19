   import 'dart:math';

import 'package:budget_flutter_app/models/expense_model.dart';

import '../models/category_model.dart';

  final rand = Random();

  final List<double> weeklySpending = [
    rand.nextDouble() * 100,
    rand.nextDouble() * 100,
    rand.nextDouble() * 100,
    rand.nextDouble() * 100,
    rand.nextDouble() * 100,
    rand.nextDouble() * 100,
    rand.nextDouble() * 100,
  ];

  _generateExpense () {
    List<Expense> expenses = [
      Expense(name: "Item 0", cost: rand.nextDouble()*90),
      Expense(name: "Item 1", cost: rand.nextDouble()*90),
      Expense(name: "Item 2", cost: rand.nextDouble()*90),
      Expense(name: "Item 3", cost: rand.nextDouble()*90),
      Expense(name: "Item 4", cost: rand.nextDouble()*90),
      Expense(name: "Item 5", cost: rand.nextDouble()*90),
    ];
    return expenses;
  }

  List<Category> categories = [
    Category(name: "Food", maxAmount: 450, expenses: _generateExpense()),
    Category(name: "Clothing", maxAmount: 500, expenses: _generateExpense()),
    Category(name: "Utilities", maxAmount: 600, expenses: _generateExpense()),
    Category(name: "Entertainment", maxAmount: 330, expenses: _generateExpense()),
    Category(name: "Transportation", maxAmount: 500, expenses: _generateExpense()),
    Category(name: "Housing", maxAmount: 1000, expenses: _generateExpense()),
  ];