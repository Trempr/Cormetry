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
      height: size.height,
      width: double.infinity,
      child:  Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
        Positioned(
          top:-155,
          left:-155,
          child: Image.asset("assets/images/signup_top.png", width: size.width*1.5, color: const Color.fromARGB(223, 0, 119, 255),),
          ),
        Positioned(
          bottom:-200,
          left:-155 ,
          child: Image.asset("assets/images/login_bottom.png", width: size.width*2,)
          ),
        child,
        ],
      )
    );
  }
}
