import 'package:flutter/material.dart';

class Backgraund extends StatelessWidget {
  final Widget child;
  const Backgraund({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //Bu bize ekranın her yüksekilik ve genişliğni kullanmamızı sağlıyor.
    // ignore: sized_box_for_whitespace
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
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
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * 0.3, color: const Color.fromARGB(255, 228, 116, 68),
            ),
          ),
          child,
        ],
      ),
    
    );
  }
}