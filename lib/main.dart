import 'package:bmi/ui/Input_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primaryColor: const Color(0xff0A0E22), //
        scaffoldBackgroundColor: const Color(0xff0A0E22),
        appBarTheme: const AppBarTheme(
          color: Color(0xff0A0E22),
        ),

      ),
      home: const InputScreen(),
    );
  }
}
