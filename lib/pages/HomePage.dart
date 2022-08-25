import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar:AppBar(
            title: Text("Welcome"),
          ),
          body: Center(
            child: Container(child: Text("First Flutter App")),
          ),
          drawer:const Drawer(),
        ));
  }
}
