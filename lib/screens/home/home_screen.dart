
  import 'package:flutter/material.dart';

import 'components/home_body.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(child:
    Scaffold(
      body: HomeBody(),
    )

    );
  }
}