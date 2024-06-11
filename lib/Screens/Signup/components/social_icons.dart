import 'package:flutter/material.dart';
import 'package:flutter_application_5/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcon extends StatelessWidget {
  final String iconSrc;
  final void Function()? press;
  const SocialIcon({
    super.key, required this.iconSrc, required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(border: Border.all(
          width: 2,
          color: kPrimaryLightColor,
        ), 
        shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          height: 20,
          width: 20,),
      ),
    );
  }
}

