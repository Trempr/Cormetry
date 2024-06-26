// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class Backgraund extends StatelessWidget {
  final Widget child; 
  const Backgraund({
    super.key, required this.child,    
  });

  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child:  Stack(
    alignment: Alignment.center,
    children: <Widget>[
      Positioned(
        top: 0,
        left: 0,
        child: Image.asset(
          "assets/images/main_top.png",
          width: size.width * 0.4,
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Image.asset(
        "assets/images/login_bottom.png",
        width: size.width * 0.5,
         ),
       ),
       child,          
     ],
    ),
         );
  }
}