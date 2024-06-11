// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class Backgraund extends StatelessWidget {

  final Widget child;
  const Backgraund({
    super.key,    
    required this.child,
  });
   

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(alignment: Alignment.center,
      children: <Widget>[
            Positioned(
              top:0,
              left:0,
              child: Image.asset("assets/images/signup_top.png",width: size.width* 0.4),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_bottom.png",
                width: size.width * 0.35,
                color: const Color.fromARGB(255, 146, 113, 245),
              ),
            ),
            child,
      ],
      )
    );
  }
}