  import 'package:budget_flutter_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

  class App extends StatelessWidget{

    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      title: "Budget App",
      theme: ThemeData(
        primaryColor: Colors.amber,
        primarySwatch: Colors.amber,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

  }