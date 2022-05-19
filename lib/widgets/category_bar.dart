
import 'package:budget_flutter_app/utils/color_helper.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';
class CategoryBar extends StatelessWidget{

  final Category category;
  final double totalAmountSpent;


  CategoryBar({
    required this.category,
    required this.totalAmountSpent,
});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [

        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(category.name,style: TextStyle(fontWeight: FontWeight.w500),),
            Text("\$${(category.maxAmount-totalAmountSpent).toStringAsFixed(2)} / \$${category.maxAmount}",style: TextStyle(fontWeight: FontWeight.w500),),
          ],
        ),
        SizedBox(height: 10,),
         LayoutBuilder(builder:(BuildContext context,BoxConstraints constraints){
           final double maxBarWidth = constraints.maxWidth;
           final double percent = (category.maxAmount - totalAmountSpent) /category.maxAmount ;
           final double barWidth = percent * maxBarWidth;
           return    new Stack(
             children: [
               new Container(
                 height: 20.0,
                 decoration: BoxDecoration(
                     color: Colors.grey[200],
                     borderRadius: BorderRadius.circular(10.0)
                 ),
               ),
               new Container(
                 height: 20.0,
                 width: barWidth,
                 decoration: BoxDecoration(
                     color: getColor(context, percent),
                     borderRadius: BorderRadius.circular(10.0)
                 ),
               )
             ],
           );
         } ),
      ],
    );
  }
}