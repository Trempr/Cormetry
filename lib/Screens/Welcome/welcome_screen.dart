import 'package:flutter/material.dart';
import 'package:flutter_application_5/Screens/Welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Body(),
    );
  }
}