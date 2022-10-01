

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lighttheme = ThemeData(
    brightness:Brightness.light,
      cardColor: Colors.white,
      canvasColor: creamColor,
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
      accentColor: darkBluishColor,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: darkBluishColor),
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          toolbarTextStyle:
              TextStyle(color: Colors.green, fontWeight: FontWeight.bold)));





  static ThemeData darktheme = ThemeData(
    brightness: Brightness.dark,
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
      accentColor: Colors.white,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: lightBluishColor),
      appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          toolbarTextStyle:
              TextStyle(color: Colors.green, fontWeight: FontWeight.bold)));

  //Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
