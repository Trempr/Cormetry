import 'package:flutter/material.dart';
import 'package:flutter_application_5/Screens/Login/login_screen.dart';
import 'package:flutter_application_5/Screens/Signup/signup_screen.dart';
import 'package:flutter_application_5/Screens/Welcome/components/backgraund.dart';
import 'package:flutter_application_5/components/rounded_button.dart';
import 'package:flutter_application_5/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({super.key});
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Backgraund(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Cormetry",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor, fontSize: 30)),
          const Text("HOŞ GELDİNİZ",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor, fontSize: 25)),
          SvgPicture.asset("assets/icons/18.medical-checkup.svg",
              height: size.height * 0.45),
          RoundedButton(
            text: 'GİRİŞ YAPINIZ',
            color: kPrimaryColor,
            textColor: kPrimaryLightColor,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {return const LoginScreen();},),);
            },
          ),
          RoundedButton(            
            text: 'KAYIT OLUNUZ',
            color: kPrimaryLightColor,
            textColor: kPrimaryColor,
            press: () {Navigator.push(context,MaterialPageRoute(builder: (context) {return const SignUpScreen();
              },
            ),
           );
          }
         ),
        ],
      ),
    );
  }
}