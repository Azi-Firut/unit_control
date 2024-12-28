import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';
import '../../../constant.dart';
import '../../../sand_box_web_view.dart';
import '../../data/remote/models/wifi_name_pass_logo_model.dart';

/// auto wifi connect libs
import 'package:wiflutter/enums/enterprise_certificate_enum.dart';
import 'package:wiflutter/wiflutter.dart';

class UnitCardWiFi extends StatelessWidget {
  final Map<String, dynamic> accessPoints;
  final int index;
  final jsonMap;
  final int indexOfsearchedElement;

  UnitCardWiFi(
      {Key? key,
      required this.accessPoints,
      required this.index,
      required this.jsonMap,
      required this.indexOfsearchedElement})
      : super(key: key);

  WiFlutter autoWifiConnectDisconnect = WiFlutter();

  conn() async {
    WiFiForIoTPlugin.registerWifiNetwork("${accessPoints['originalSSID']}");
    //WiFiForIoTPlugin.findAndConnect("${accessPoints['originalSSID']}");
    await WiFiForIoTPlugin.connect("${accessPoints['originalSSID']}");
    print('conSid------------=-=-=-=');
    //WiFiForIoTPlugin.showWritePermissionSettings(true);
    // WiFiForIoTPlugin.forceWifiUsage(true);
    // WiFiForIoTPlugin.setWiFiAPEnabled(true);
    await WiFiForIoTPlugin.connect(
      "${accessPoints['originalSSID']}",
      bssid: "${accessPoints['bssid']}",
      password: "${jsonMap[indexOfsearchedElement].pass}",
      timeoutInSeconds: 15,
      //  joinOnce: true,
      security: NetworkSecurity.WPA,
      withInternet: true, // false
    );
  }

  @override
  Widget build(BuildContext context) {
    print(
        "Unit Card ------> $accessPoints ${accessPoints['bssid']} ${jsonMap[indexOfsearchedElement].pass} ${jsonMap[indexOfsearchedElement].logo}");

    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, top: 9, bottom: 9),
      child: GestureDetector(
        onTap: () async {
          conn();

          /// navigation to unit GUI
          Future.delayed(Duration(seconds: 3), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  if (WiFiForIoTPlugin.getSSID() ==
                      "${accessPoints['originalSSID']}") {
                    print("----------- load web view");
                    print("----------- ${WiFiForIoTPlugin.getSSID()}");
                    return WebMyApp(
                        namePage: '${accessPoints['originalSSID']}');
                  } else {
                    return WebMyApp(
                        namePage: '${accessPoints['originalSSID']}');
                  }
                },
              ),
            );
          });
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       if (WiFiForIoTPlugin.getSSID() ==
          //           "${accessPoints['originalSSID']}") {
          //         print("----------- load web view");
          //         print("----------- ${WiFiForIoTPlugin.getSSID()}");
          //         return WebMyApp(namePage: '${accessPoints['originalSSID']}');
          //       } else {
          //         return WebMyApp(namePage: '${accessPoints['originalSSID']}');
          //       }
          //     },
          //   ),
          // );
        },
        child: Card(
          shadowColor: Colors.black,
          elevation: 8,
          surfaceTintColor: Colors.white,
          color: Colors.white,
          child: Column(
            children: [
              // Image.network(jsonMap[indexOfsearchedElement].logo),
              Image.asset(jsonMap[indexOfsearchedElement].logo),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  accessPoints['originalSSID'].isNotEmpty
                      ? accessPoints['originalSSID']
                      : "**EMPTY**",
                  textScaleFactor: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
