  import 'package:budget_flutter_app/data/data.dart';
import 'package:budget_flutter_app/models/expense_model.dart';
import 'package:budget_flutter_app/screens/category/category_screen.dart';
import 'package:budget_flutter_app/widgets/bar_chart.dart';
import 'package:budget_flutter_app/widgets/category_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  class HomeBody extends StatelessWidget{
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: [
        customSilverAppBar(),

        customSilverList(),

      ],
    );
  }

  Widget customSilverAppBar(){
      return SliverAppBar(
        floating: true,
        forceElevated: false,
        expandedHeight: 100,
        leading: IconButton(
          icon: Icon(Icons.settings,color: Colors.white,),
          iconSize: 30.0,
          onPressed: (){},
        ),
        flexibleSpace: FlexibleSpaceBar(
          title: Text("Simple Budget",style: TextStyle(color: Colors.white),),
          centerTitle: true,

        ),
        actions: [
          IconButton(
            onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,),
            iconSize: 30,
          )
        ],
      );
  }

    Widget customSilverList(){

      return  SliverList(
          delegate:SliverChildBuilderDelegate((BuildContext context,int index){
            return index ==0 ?totalBar() : categoryBar(context,index);

      },
         childCount: 1 + categories.length
          ),

      );

    }
    Widget totalBar(){
     return Container(
        margin: EdgeInsets.all(10),

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0,2),
                blurRadius: 6.0,
              )
            ]
        ),
        child: BarChart(expenses: weeklySpending,),
      );
    }

    Widget categoryBar(BuildContext context,int index){
      double totalAmountSpent =0.0;
      categories[index-1].expenses.forEach((Expense expense) {
        totalAmountSpent +=expense.cost;
      });
      return

      InkWell(
        onTap: (){
          Navigator.push(context,
          MaterialPageRoute(builder: (context)=>CategoryScreen(category: categories[index-1]))
          );
      
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          padding: EdgeInsets.only(top: 30.0,bottom: 20.0,left: 10.0,right: 10.0),


          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0,2),
                  blurRadius: 6.0,
                )
              ]
          ),
          child: CategoryBar(category: categories[index-1],totalAmountSpent: totalAmountSpent),

        ),
      );
    }
  }