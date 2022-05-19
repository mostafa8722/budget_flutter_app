
import 'package:flutter/material.dart';

class Bar extends StatelessWidget{

  final String label;
  final double amountSpent;
  final double mostExpensive;
  final double _maxHeightBar = 150.0;
  Bar({
    required this.label,
    required this.amountSpent,
    required this.mostExpensive,
});
  @override
  Widget build(BuildContext context) {
    final _barHeight = amountSpent/mostExpensive * _maxHeightBar;
    return new Column(
      children: [
        Text("${amountSpent.toStringAsFixed(2)}"
        ,style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Container(
          height: _barHeight,
          width: 18.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.green
          ),
        ),
        Text(label
          ,style: TextStyle(fontWeight: FontWeight.w600),
        ),

      ],
    );
  }
}