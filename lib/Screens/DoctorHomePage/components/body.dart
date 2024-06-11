// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_5/Screens/DoctorHomePage/components/backgraund.dart';
import 'package:flutter_application_5/components/tarih_saat.dart';
import 'package:flutter_application_5/constants.dart';

class Body extends StatelessWidget {  
  const Body({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {  
    return  Backgraund(
      child: SingleChildScrollView(
      child: Column(            
        children: <Widget>[
          AppBar(
              toolbarHeight: 100,                
              title:              
              const Text(
    "Hoşgeldiniz \n   Doktor Ayşe hanım    \n      Takip ettiğiniz hastalar",
               style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),),
              backgroundColor: const Color.fromARGB(224, 254, 254, 254),                
          ),
          const TarihSaat(text: "Emirhan Kandil",),
          const TarihSaat(text: "Bilal Kürşat Demirbilek",),
          const TarihSaat(text: "Enes Emeksiz",),
          const TarihSaat(text: "Yunus Emre Mert",),
          const TarihSaat(text: "Ziya Müftüoğlu",),
          const TarihSaat(text: "Muhammed Ali Soydaş",),
          const TarihSaat(text: "Sıla Çakmak",),
          const TarihSaat(text: "Emin Emirhan Şener",),
          const TarihSaat(text: "Ulaş Uşaklı",),
          const TarihSaat(text: "Fatih Terim",),
          const TarihSaat(text: "Sena Şener",),
          const TarihSaat(text: "Paul George",),
          const TarihSaat(text: "İlber Ortaylı",),
          const TarihSaat(text: "Kemal Kılıçdaroğlu",),
          const TarihSaat(text: "Robert Downey JR.",),
          const TarihSaat(text: "Cris Evans",),
          const TarihSaat(text: "Mauro Emanuel İcardi Rivero",),
          const TarihSaat(text: "Lionel Messi",),
          
        ]
      ),
      ),
    );
  }
}


