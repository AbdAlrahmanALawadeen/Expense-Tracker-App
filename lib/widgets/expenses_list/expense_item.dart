import 'package:flutter/material.dart';
import 'package:project/models/expense.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title,),
            const SizedBox(height: 10,),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                 Row(children: [
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(width: 8,),
                  Text(expense.formattedDate)
                ],)
              ],
            )
          ],
        ),
      ),
    );
  }

}