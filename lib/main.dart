import 'package:catlog_flutter/pages/cart_page.dart';
import 'package:catlog_flutter/pages/home_detail_page.dart';
import 'package:catlog_flutter/pages/home_page.dart';
import 'package:catlog_flutter/pages/login_page.dart';
import 'package:catlog_flutter/utils/routes.dart';
import 'package:catlog_flutter/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lighttheme(context),
      darkTheme: MyTheme.darktheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
