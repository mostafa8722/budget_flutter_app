import 'package:budget_flutter_app/app.dart';
import 'package:budget_flutter_app/models/category_model.dart';
import 'package:flutter/material.dart';

import 'category_body.dart';

class CategoryScreen extends StatelessWidget{
  Category category;

  CategoryScreen({required this.category});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text(category.name,style: TextStyle(color: Colors.white),),
        actions: [
         InkWell(
           onTap: (){},
           child: Icon(Icons.add,color: Colors.white,size: 18,),
         )
        ],
      ),
      body: CategoryBody(category: category),
    );
  }

}