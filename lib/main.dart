import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_receipe/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Color(0x00000000),
          systemNavigationBarColor: Color(0xFFFFFFFF),
        ));
    return MaterialApp(
      title: 'Food Receipe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        canvasColor: Color(0xFFFAFAFA)
      ),
      initialRoute: "/",
      routes: {
        '/' : (context) => HomePage()
      },
    );
  }
}