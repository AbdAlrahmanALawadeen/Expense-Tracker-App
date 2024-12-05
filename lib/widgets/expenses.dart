import 'package:flutter/material.dart';
import 'package:project/widgets/charts/chart.dart';
import 'package:project/widgets/expenses_list/expenses_list.dart';
import 'package:project/models/expense.dart';
import 'package:project/widgets/new_expense.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
   return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{

  final List<Expense> _registeredExpenses = [
    Expense(title: 'Flutter Course', amount: 19.99, date: DateTime.now(), category: Category.work),
    Expense(title: 'Cinema', amount: 16.99, date: DateTime.now(), category: Category.leisure),
    Expense(title: 'Flutter Course', amount: 19.99, date: DateTime.now(), category: Category.work),
    Expense(title: 'Flutter Course', amount: 19.99, date: DateTime.now(), category: Category.work),
  ];

  void _openAddExpenseOverlay(){
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context, 
      builder: (ctx) => 
      NewExpense(
        onAddExpense: _addExpense,
      )
    );
  }

  void _addExpense(Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense){
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(
          seconds: 3,
        ),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo', 
          onPressed: (){
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(child: Text('No expenses found. Start adding some!'),);

    if(_registeredExpenses.isNotEmpty){
      mainContent = ExpensesList(
              expenses: _registeredExpenses, 
              onRemoveExpense: _removeExpense,
            );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 193, 193),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 6, 129),
        title: const Text('Flutter ExpenseTracker', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        actions:[
          IconButton(
            onPressed: _openAddExpenseOverlay, 
            icon: const Icon(
              Icons.add, 
              color: Colors.white,
            )
          )
        ],
      ),
      body: width < 600 ? Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ) : Row(
        children: [
          Expanded(child: Chart(expenses: _registeredExpenses)),
            Expanded(
              child: mainContent,
            ),
        ],
      ),
    );
  }

}