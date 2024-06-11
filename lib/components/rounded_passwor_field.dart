import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/text_field_container.dart';
import 'package:flutter_application_5/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    super.key, required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return  TextFieldContainer(
      child: TextField(  
        obscureText: true,
        onChanged: onChanged,     
        decoration: const InputDecoration(
          hintText: "Şifrenizi giriniz",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(Icons.visibility,color: kPrimaryColor,),
            border: InputBorder.none
        ),
      ),
    );
  }
}



