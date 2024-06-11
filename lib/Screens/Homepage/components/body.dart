import 'package:flutter/material.dart';
import 'package:flutter_application_5/Screens/BluetoothPage/bluetooth_page.dart';
import 'package:flutter_application_5/Screens/Homepage/components/backgraund.dart';
// ignore: unused_import
import 'package:flutter_application_5/components/tarih_saat.dart';
import 'package:flutter_application_5/constants.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> dataLog = [];

  void _onDataReceived(String data) {
    setState(() {
      dataLog.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Backgraund(
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppBar(
                  toolbarHeight: 70,
                  title: const Text(
                    "Hoşgeldiniz Ahmet Bey. \n        Ölçüm sonuçlarınız",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: kPrimaryColor),
                  ),
                  backgroundColor: const Color.fromARGB(224, 254, 254, 254),
                  actions: [
                    PopupMenuButton<String>(
                        itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry<String>>[
                        // ignore: sort_child_properties_last
                        PopupMenuItem(
                            child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Bluetoothpage();
                                },
                              ),
                            );
                          },
                          child: const Text('Bluetooth bağlantı ayarları'),
                        ))
                      ];
                    })
                  ]),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: dataLog.map((data) {
                  return ElevatedButton(
                    onPressed: () {
                      /*
                      showDialog(context: context, builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Alınan veri"),
                        content: Text(data),
                        actions: <Widget>[
                          TextButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, child: const Text('Kapat'))
                        ],
                      );
                      });*/
                    },
                    child: Text(data),
                  );
                }).toList(),
              )
            ]),
      ),
    ));
  }
}
