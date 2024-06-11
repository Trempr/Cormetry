// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_5/Screens/BluetoothPage/bluetooth_page.dart';
import 'package:flutter_application_5/Screens/DoctorHomePage/doctor_home_page.dart';
import 'package:flutter_application_5/Screens/Homepage/home_page.dart';
import 'package:flutter_application_5/Screens/Login/components/backgraund.dart';
import 'package:flutter_application_5/Screens/Signup/signup_screen.dart';
import 'package:flutter_application_5/components/already_have_an_account_check.dart';
import 'package:flutter_application_5/components/rounded_button.dart';
import 'package:flutter_application_5/components/rounded_input_field.dart';
import 'package:flutter_application_5/components/rounded_passwor_field.dart';
import 'package:flutter_application_5/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String inputText = '';
    return Backgraund(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "GİRİŞ YAPINIZ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: kPrimaryColor),
          ),
          SvgPicture.asset(
            "assets/icons/19.medical-staff.svg",
            height: size.height * 0.4,
          ),
          RoundedInputField(
            hintText: "T.C. kimlik numranızı giriniz",
            onChanged: (value) {
              inputText = value;
            },
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "GİRİŞ YAPIN",
            color: kPrimaryColor,
            press: () {
              if (inputText == '1234567') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return const Bluetoothpage();
                    }),
                  ),
                );
              } else if (inputText == '2345678') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return const DoctorHomaPage(); // DoctorHomePage ekranına yönlendir
                    }),
                  ),
                );
              }
            },
          ),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}
