import 'package:flutter/material.dart';
import 'package:flutter_application_5/constants.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height*0.02),
      width: size.width*0.8,
      child: const Row(children: <Widget>[

        BulidDivider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("Ya da",style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),),
        ),
        BulidDivider(),
        ],
      ),
    );
  }
}

class BulidDivider extends StatelessWidget {
  const BulidDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Divider(color: Color(0xFFD9D9D9),
      height: 1.5,),
      );
  }
}