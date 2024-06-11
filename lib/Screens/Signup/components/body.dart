import 'package:flutter/material.dart';
import 'package:flutter_application_5/Screens/Login/login_screen.dart';
import 'package:flutter_application_5/Screens/Signup/components/backgraund.dart';
import 'package:flutter_application_5/Screens/Signup/components/or_divider.dart';
import 'package:flutter_application_5/Screens/Signup/components/social_icons.dart';
import 'package:flutter_application_5/components/already_have_an_account_check.dart';
import 'package:flutter_application_5/components/rounded_button.dart';
import 'package:flutter_application_5/components/rounded_input_field.dart';
import 'package:flutter_application_5/components/rounded_passwor_field.dart';
import 'package:flutter_application_5/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  final Widget child;
  const Body({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Backgraund(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "KAYIT OLUNUZ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontSize: 20),
          ),
          SvgPicture.asset(
            "assets/icons/19.medical-staff.svg",
            height: size.height * 0.4,
          ),
          RoundedInputField(
              hintText: "T.C. kimlik numaranızı giriniz.",
              onChanged: (value) {}),
          RoundedPasswordField(onChanged: (value) {}),
          RoundedButton(text: "KAYIT OLUN", color: kPrimaryColor, press: () {}),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LoginScreen();
              }));
            },
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          const OrDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SocialIcon(
                iconSrc: "assets/icons/google-plus.svg",
                press: () {},
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
