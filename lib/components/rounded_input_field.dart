
import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/text_field_container.dart';
import 'package:flutter_application_5/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon,icon2;
  final ValueChanged<String>  onChanged;
  const RoundedInputField({
    super.key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    this.icon2= Icons.password,
  });


 @override
  Widget build(BuildContext context) {
    return  TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(icon,color: kPrimaryColor),
            hintText: hintText,
            border: InputBorder.none,),
      ),
    );
  }
}
