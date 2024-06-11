import 'package:flutter/material.dart';
import 'package:flutter_application_5/constants.dart';


class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    super.key,
    this.login = true,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: <Widget>[
        Text(
         login ? "Hesabınız yok mu? " : "Zaten bir hesabınız var mı?  ",
         style: const TextStyle(color: kPrimaryColor),
       ),
       GestureDetector(
         onTap: press as void Function()?,
         child: Text(
           login ? " Hemen kayıt olun.": "Hemen giriş yapın.",
           style:const TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold
           ),
         ),
       ),
            ],);
  }
}

