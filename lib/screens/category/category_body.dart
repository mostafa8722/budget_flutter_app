
import 'package:budget_flutter_app/models/category_model.dart';
import 'package:budget_flutter_app/models/expense_model.dart';
import 'package:budget_flutter_app/widgets/radial_painter.dart';
import 'package:flutter/material.dart';

import '../../utils/color_helper.dart';
class CategoryBody extends StatelessWidget{
  Category category ;
  CategoryBody({required this.category});
  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0.0 ;
    category.expenses.forEach((Expense expense) {
      totalAmountSpent += expense.cost;
    });
    double amountLeft = category.maxAmount - totalAmountSpent ;
    double percent =  amountLeft/category.maxAmount ;

    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
            height: 250.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0,2),
                  blurRadius: 6.0,
                )
              ]

            ),
            child: Center(
              child: Container(
                height: 200.0,
                width: 200.0,
                child:  CustomPaint(
                  foregroundPainter : RadialPainter(
                      bgColor: Colors.grey,
                      linearColor: getColor(context,percent),
                      percent:percent,
                      width: 15.0
                  ),

                  child: Center(
                    child: Text(
                        "\$${amountLeft.toStringAsFixed(2)}/\$${category.maxAmount}"
                    ),
                  ),
                ),
              ),
            )
            ),
          SizedBox(height: 4,),
           Container(
             height: 400.0,
             child:      ListView.builder(
                 itemCount: category.expenses.length,
                 itemBuilder: (BuildContext context,int index)=>customBuilder(index)),
           )

        ],
      ),
    );
  }
  Widget customBuilder(int index){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      padding: EdgeInsets.only(top: 25,bottom:15,left: 10,right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0,2),
            color: Colors.grey,
            blurRadius: 6.0
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(category.expenses[index].name),
          Text("\$ ${category.expenses[index].cost.toStringAsFixed(2)}"),
        ],
      ),

    );
  }
}