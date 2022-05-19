
import 'package:budget_flutter_app/models/expense_model.dart';
import 'package:budget_flutter_app/widgets/bar.dart';
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget{
  List<double> expenses;
  double mostExpense = 0.0;

  BarChart({required this.expenses});
  @override
  Widget build(BuildContext context) {
    expenses.forEach((double element) {
      if(element>mostExpense)
        mostExpense = element;

    });
    // TODO: implement build
    return Column(
      children: [
        SizedBox(height: 4,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Weekly Spending")
          ],
        ),
        SizedBox(height: 4,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.arrow_back),
              iconSize: 30,
            ),
            Text("Nov 10,2019 - Nov 16,2019"
            ,style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w100,
                letterSpacing: 1.2
              ),
            ),

            IconButton(
              onPressed: (){},
              icon: Icon(Icons.arrow_forward),
              iconSize: 30,
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Bar(label: "Sun", amountSpent: expenses[0], mostExpensive: mostExpense),
          Bar(label: "Mon", amountSpent: expenses[1], mostExpensive: mostExpense),
          Bar(label: "Tue", amountSpent: expenses[2], mostExpensive: mostExpense),
          Bar(label: "Wed", amountSpent: expenses[3], mostExpensive: mostExpense),
          Bar(label: "Thr", amountSpent: expenses[4], mostExpensive: mostExpense),
          Bar(label: "Fri", amountSpent: expenses[5], mostExpensive: mostExpense),
          Bar(label: "Sat", amountSpent: expenses[6], mostExpensive: mostExpense),
    ],
        ),
        SizedBox(height: 15),
      ],
    );
  }
}