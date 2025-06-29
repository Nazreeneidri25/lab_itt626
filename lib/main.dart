import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab_itt626/screens/about.dart';
import 'package:lab_itt626/screens/homepage.dart';
import 'package:lab_itt626/widget/parentWidget.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme()
      ),
      initialRoute: "/",
      routes: {
        "/" : (context) => ParentWidget(child: Homepage()),
        "/about" : (context) => ParentWidget(child: AboutPage())
      },
    );
  }
}

