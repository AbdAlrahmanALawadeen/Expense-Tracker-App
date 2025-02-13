import 'package:flutter/material.dart';
import 'package:project/models/expense.dart';
import 'package:project/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => 
      Dismissible(
        key: ValueKey(expenses[index]), 
        onDismissed: (diretion){
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index])
      )
    ); 
  }

}