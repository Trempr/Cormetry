import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class BleStream extends GetxController {
  final StreamController<List<String>> _dataStreamController =
      StreamController<List<String>>.broadcast();
  final StreamController<Map<String, List<int>>> resultData =
      StreamController<Map<String, List<int>>>.broadcast();
  Future<void> readCharacteristic(BluetoothDevice device) async {
    BluetoothConnection? connection;
    List<String> dataString = [];
    List<int> v1 = [];
    List<int> v2 = [];
    List<int> v3 = [];
    List<int> v4 = [];
    List<int> v5 = [];
    List<int> v6 = [];
    List<int> RA = [];
    List<int> RL = [];
    try {
      connection = await BluetoothConnection.toAddress(device.address);
      print('Bağlandı ${device.address}');

      final subscription = connection.input!.listen((Uint8List data) {
        dataString.add(String.fromCharCodes(data));
        _dataStreamController.add(dataString);

        if (dataString.last.length == 40) {
          List<String> valueList = dataString.last.split(",");
          List<int> values = valueList.map(int.parse).toList();
          // print(values);
          v1.add(values[0]);
          v2.add(values[1]);
          v3.add(values[2]);
          v4.add(values[3]);
          v5.add(values[4]);
          v6.add(values[5]);
          RA.add(values[6]);
          RL.add(values[7]);
        }
      });

      // 5 saniye bekle
      await Future.delayed(Duration(seconds: 10));

      // Dinlemeyi ve bağlantıyı kapat
      subscription.cancel();
      // connection.close();
      print('Bağlantı kapatıldı');
    } catch (error) {
      print("Bağlantı Hatası: $error");
    } finally {
      _dataStreamController.add(["OK"]);

      await Future.delayed(Duration(seconds: 1));

      var temp = {
        "v1": v1,
        "v2": v2,
        "v3": v3,
        "v4": v4,
        "v5": v5,
        "v6": v6,
        "RA": RA,
        "RL": RL
      };
      resultData.add(temp);
      // Bağlantı nesnesini temizle
      // connection?.dispose();
    }
    //   List<String> dataString = [];
    // await BluetoothConnection.toAddress(device.address).then((connection) {
    //   connection.input!.listen((Uint8List data) {
    //     dataString.add(utf8.decode(data));
    //   _dataStreamController.add(dataString);
    //
    //   });
    // }).catchError((error) {
    //   print("Bağlantı Hatası");
    // });
  }

  Stream<List<String>> get dataStream => _dataStreamController.stream;
  Stream<Map<String, List<int>>> get resultStream => resultData.stream;
}
