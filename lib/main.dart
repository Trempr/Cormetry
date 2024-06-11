import 'package:flutter/material.dart';
import 'package:flutter_application_5/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_application_5/constants.dart';

void main() {
  runApp(const MyApp(),);  
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,

        ),
      home: const WelcomeScreen(),
    );
  }
}


