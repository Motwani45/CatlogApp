import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData lighttheme=ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts
          .lato()
          .fontFamily,
      appBarTheme:const AppBarTheme(color: Colors.white,elevation: 0,iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),
          toolbarTextStyle: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)));
  static ThemeData darktheme=ThemeData(
      brightness: Brightness.dark);


}