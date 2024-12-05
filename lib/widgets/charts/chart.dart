import 'package:flutter/material.dart';
import 'package:project/models/expense.dart';
import 'package:project/widgets/charts/chart_bar.dart';

class Chart extends StatelessWidget{
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets{
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.work),
      ExpenseBucket.forCategory(expenses, Category.travel),
    ];
  }

  double get maxTotalExpense{
    double maxTotalExpense = 0;

    for(final bucket in buckets){
      if(bucket.totlaExpanses > maxTotalExpense){
        maxTotalExpense = bucket.totlaExpanses;
      }
    }
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(colors: [
          Colors.grey, Colors.white,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
        )
      ),
      child: Column(
        children: [
          Expanded(child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for(final bucket in buckets)
                ChartBar(
                  fill : bucket.totlaExpanses / maxTotalExpense,
                )
              
            ],
          )
        ),
        const SizedBox(height: 12,),

        Row(
          children: buckets.map(
            (bucket) => Expanded(
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 14
              ),
              child: Icon(
                categoryIcons[bucket.category],
                color : const Color.fromARGB(255, 43, 6, 129),
              ),
              ),
            )
          ).toList(),
        )
        ],
      ),
    );
  }
  
}