

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
    brightness:Brightness.light,
      // textTheme: Theme.of(context).textTheme.copyWith(headline6: context.textTheme.headline6?.copyWith(color: Colors.black)),
      cardColor: Colors.white,
      canvasColor: creamColor,
      focusColor: darkBluishColor,
      // textTheme: TextTheme(displayMedium: TextStyle(fontSize: 2)),
      hintColor: Colors.grey,
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: MyTheme.darkBluishColor,fontSize: 20),
          errorStyle: TextStyle(color: Colors.red),
          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Vx.gray400,width: 2)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:darkBluishColor,width: 2)
        )
      ),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: darkBluishColor),
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          foregroundColor:darkBluishColor ,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
      ));





  static ThemeData darktheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
      // textTheme: Theme.of(context).textTheme.copyWith(headline6: context.textTheme.headline6?.copyWith(color: Colors.white)),
      hintColor: Colors.grey,
      cardColor: Colors.black,
      focusColor: Colors.white,
      canvasColor: darkCreamColor,
      inputDecorationTheme: InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: MyTheme.lightBluishColor,fontSize: 20),
          errorStyle: TextStyle(color: Colors.red),
          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color:lightBluishColor,width: 2)
          )
      ),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: lightBluishColor),
      appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0,
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
      )
  );

  //Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
