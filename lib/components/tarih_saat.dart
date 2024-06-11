import 'package:flutter/material.dart';
import 'package:flutter_application_5/constants.dart';

class TarihSaat extends StatelessWidget {
  final String text;
  const TarihSaat({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[            
            Text(
              text,
              style: const TextStyle(color: kPrimaryColor),
              textAlign: TextAlign.right,
            ),
            const Icon(Icons.download),
          ],
        ),
      ),
    );
  }
}
