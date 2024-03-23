import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';

class NetworkInfoP extends StatefulWidget {

  const NetworkInfoP({Key? key,}) : super(key: key);

  @override
  State<NetworkInfoP> createState() => _NetworkInfoState();
}

class _NetworkInfoState extends State<NetworkInfoP> {
  String deviceName = '';
  String udid = '';
  String systemName = '';
  void getDeviceInfo() async{
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if(Platform.isAndroid){
    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    setState(() {
      deviceName = androidDeviceInfo.manufacturer;
    });
    }
    else if(Platform.isIOS){
      IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      setState(() {
            deviceName = iosDeviceInfo.name;
      udid = iosDeviceInfo.identifierForVendor!;
      systemName = iosDeviceInfo.systemName;
      });
    }
  }
void getNetworkInfo() async{
  final network = NetworkInfo();

  final wifi = await network.getWifiName();
}
  @override
  void initState() {
    super.initState();
    getDeviceInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Info'),
      ),
      body: Container(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 50,
                width: 100,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 21, 118, 197),
                    Color.fromARGB(255, 79, 232, 230)
                  ]),
                  borderRadius: BorderRadius.all(Radius.circular(7))
                ),
                child: Center(child: Text(systemName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 7),
              width: 250,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
    Color.fromARGB(255, 21, 118, 197),
                    Color.fromARGB(255, 79, 232, 230)
                ]),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:  EdgeInsets.all(5.0),
                    child: Text('Device Specifications',  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18,)),
                  ),
                   Padding(
                    padding:  const EdgeInsets.all(5.0),
                    child: Text('Device Name: $deviceName',  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                   Padding(
                    padding:  const EdgeInsets.all(5.0),
                    child: Text('Model Number: $udid',  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}