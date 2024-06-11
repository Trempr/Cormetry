import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/Screens/BluetoothPage/components/backgraund.dart';
import 'package:flutter_application_5/ble_stream.dart';
import 'package:flutter_application_5/constants.dart';
import 'package:flutter_application_5/flChart.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';

class Body extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  BluetoothConnection? _connection;
  bool isConnecting = true;
  bool isConnected = false;
  String receivedData = "Henüz veri alınmadı";

  Future<void> _checkPermissions() async {
    if (await Permission.bluetooth.isGranted &&
        await Permission.bluetoothConnect.isGranted &&
        await Permission.bluetoothScan.isGranted &&
        await Permission.location.isGranted) {
      // Bluetooth izni verilmişse devam edin
      // Bluetooth bağlantısı yapılacak işlemleri burada gerçekleştirin
    } else {
      // İzinleri isteyin
      Map<Permission, PermissionStatus> statuses = await [
        Permission.bluetooth,
        Permission.bluetoothConnect,
        Permission.bluetoothScan,
        Permission.location,
      ].request();

      if (statuses[Permission.bluetooth]!.isGranted &&
          statuses[Permission.bluetoothConnect]!.isGranted &&
          statuses[Permission.bluetoothScan]!.isGranted &&
          statuses[Permission.location]!.isGranted) {
        // Permissions are granted, do your bluetooth operations here
      } else {
        // Permissions are not granted, handle accordingly
        if (mounted) {
          setState(() {
            receivedData = "Gerekli Bluetooth izinleri verilmedi";
          });
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _checkPermissions().then((_) {
      FlutterBluetoothSerial.instance.state.then((state) {
        if (mounted) {
          setState(() {
            _bluetoothState = state;
          });
        }
      });

      FlutterBluetoothSerial.instance
          .onStateChanged()
          .listen((BluetoothState state) {
        if (mounted) {
          setState(() {
            _bluetoothState = state;
          });
        }
      });
      _startBluetooth();
    });
  }

  Future<void> _startBluetooth() async {
    if (_bluetoothState == BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
    }

    List<BluetoothDevice> devices =
        await FlutterBluetoothSerial.instance.getBondedDevices();

    bool foundArduino = false;
    // for (var device in devices) {
    //   if (device.name == "Arduino") {
    //     foundArduino = true;
    //     await _connectToDevice(device);
    //     break;
    //   }
    // }

    if (!foundArduino) {
      if (mounted) {
        setState(() {
          isConnecting = false;
          isConnected = false;
          receivedData = "Arduino cihazı bulunamadı";
        });
      }
    }
  }
/*
  Future<void> _connectToDevice(BluetoothDevice device) async {
    await BluetoothConnection.toAddress(device.address).then((connection) {
      if (mounted){
      setState(() {
        _connection = connection;
        isConnecting = false;
        isConnected = true;
      });
      }

      connection.input!.listen((Uint8List data) {
      String dataString = String.fromCharCodes(data);//String.fromCharCodes(data).replaceAll('\n', '');
      

      if(dataString.length == 40)
      {
        List<String> valueList = dataString.split(",");
        List<int> values = valueList.map(int.parse).toList();
        print(values);
        v1.add(values[0]);
        v2.add(values[1]);
        v3.add(values[2]);
        v4.add(values[3]);
        v5.add(values[4]);
        v6.add(values[5]);
        RA.add(values[6]);
        RL.add(values[7]);

        if (mounted){
        setState(() {
          receivedData = dataString;
        });
        }
        widget.onDataReceived(dataString);
      }
        
      }).onDone(() {
        if (mounted){
        setState(() {
          isConnected = false;
        });
      }
      });
    }).catchError((error) {
      if (mounted){
      setState(() {
        isConnecting = false;
        isConnected = false;
        receivedData = "Bağlantı hatası: $error";
      });
      }
    });
  }*/

  @override
  void dispose() {
    _connection?.dispose();
    super.dispose();
  }

  List<int> v1 = [];
  List<int> v2 = [];
  List<int> v3 = [];
  List<int> v4 = [];
  List<int> v5 = [];
  List<int> v6 = [];
  List<int> RA = [];
  List<int> RL = [];
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 40,
          title: const Text(
            "Hoşgeldiniz Ahmet Bey",
            style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          ),
          backgroundColor: const Color.fromARGB(224, 254, 254, 254),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: GetBuilder<BleStream>(
          init: BleStream(),
          builder: (controller) {
            return Backgraund(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _bluetoothState == BluetoothState.STATE_ON
                                ? 'Bluetooth açık'
                                : 'Bluetooth kapalı',
                            style: TextStyle(
                                color:
                                    _bluetoothState == BluetoothState.STATE_ON
                                        ? Colors.green
                                        : Colors.red),
                          ),
                          ElevatedButton.icon(
                            onPressed: isConnecting
                                ? null
                                : () => _listBondedDevices(context, controller),
                            icon: const Icon(Icons.bluetooth),
                            label: const Text('Bağlı cihazlar'),
                          ),
                        ],
                      ),
                      Center(
                        child: Text(
                          _bluetoothState == BluetoothState.STATE_OFF
                              ? "Bluetooth'unuzu açınız"
                              : "Bluetooth açık",
                          style: TextStyle(
                              color: _bluetoothState == BluetoothState.STATE_OFF
                                  ? Colors.red
                                  : Colors.green),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: const BoxDecoration(
                            //color: Colors.grey,
                            ),
                        width: double.infinity,
                        height: 640,
                        child: StreamBuilder<List<String>>(
                            stream: controller.dataStream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  if (scrollController.hasClients) {
                                    scrollController.jumpTo(scrollController
                                        .position.maxScrollExtent);
                                  }
                                });
                                return SingleChildScrollView(
                                  controller: scrollController,
                                  child: Column(
                                    children: snapshot.data!.map((result) {
                                      if (result.length == 40 &&
                                          result != "OK") {
                                        return ListTile(
                                          leading: Text(result),
                                        );
                                      } else if (result == "OK") {
                                        return StreamBuilder<
                                                Map<String, List<int>>>(
                                            stream: controller.resultStream,
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                Map<String, List<int>>?
                                                    resultMap = snapshot.data;
                                                return Column(
                                                  children: [
                                                    Container(
                                                      // padding: const EdgeInsets.all(16),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text("V1"),
                                                          Container(
                                                            width: 500,
                                                            height: 300,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16),
                                                            child: EKGChart(
                                                                ekgData:
                                                                    resultMap![
                                                                        'v1']!),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      // padding: const EdgeInsets.all(16),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text("V2"),
                                                          Container(
                                                            width: 500,
                                                            height: 300,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16),
                                                            child: EKGChart(
                                                                ekgData:
                                                                    resultMap[
                                                                        'v2']!),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      // padding: const EdgeInsets.all(16),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text("V3"),
                                                          Container(
                                                            width: 500,
                                                            height: 300,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16),
                                                            child: EKGChart(
                                                                ekgData:
                                                                    resultMap[
                                                                        'v3']!),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      // padding: const EdgeInsets.all(16),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text("V4"),
                                                          Container(
                                                            width: 500,
                                                            height: 300,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16),
                                                            child: EKGChart(
                                                                ekgData:
                                                                    resultMap[
                                                                        'v4']!),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      // padding: const EdgeInsets.all(16),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text("V5"),
                                                          Container(
                                                            width: 500,
                                                            height: 300,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16),
                                                            child: EKGChart(
                                                                ekgData:
                                                                    resultMap[
                                                                        'v5']!),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      // padding: const EdgeInsets.all(16),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text("V6"),
                                                          Container(
                                                            width: 500,
                                                            height: 300,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16),
                                                            child: EKGChart(
                                                                ekgData:
                                                                    resultMap[
                                                                        'v6']!),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      // padding: const EdgeInsets.all(16),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text("RA"),
                                                          Container(
                                                            width: 500,
                                                            height: 300,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16),
                                                            child: EKGChart(
                                                                ekgData:
                                                                    resultMap[
                                                                        'RA']!),
                                                          ),
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                          Container(
                                                            // padding: const EdgeInsets.all(16),
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16)),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                const Text(
                                                                    "RL"),
                                                                Container(
                                                                  width: 500,
                                                                  height: 300,
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          16),
                                                                  child: EKGChart(
                                                                      ekgData:
                                                                          resultMap[
                                                                              'RL']!),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              } else {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                            });
                                      } else {
                                        return SizedBox();
                                      }
                                    }).toList(),
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  void _disconnect() async {
    await _connection?.close();
    setState(() {
      isConnected = false;
    });
  }

  Future<void> _listBondedDevices(
      BuildContext context, BleStream controller) async {
    List<BluetoothDevice> bondedDevices =
        await FlutterBluetoothSerial.instance.getBondedDevices();
    showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Bağlı Cihazlar'),
          content: SingleChildScrollView(
            child: ListBody(
              children: bondedDevices.map((device) {
                return ListTile(
                  title: Text(device.name ?? 'Bilinmeyen Cihaz'),
                  onTap: () async {
                    Navigator.of(context).pop(); // Alert dialogu kapat
                    //  _connectToDevice(device); // Seçilen cihaza bağlan
                    await controller.readCharacteristic(device);
                    //  Navigator.pop(context);// BluetoothPage'e geri dön
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
