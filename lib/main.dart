import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unit_control/sand_box_wifi_connect.dart';
import 'package:unit_control/sand_box_wifi_scan.dart';
import 'package:unit_control/structure/presentation/pages/wifi_search_page.dart';
import 'package:unit_control/test2_gpt.dart';

void main() {
  runApp(const MyAppWiFiScan());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
}

// class MyUnitUI extends StatelessWidget {
//   const MyUnitUI({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       //home: MyApp(),
//       home: MyAppWiFiScan(), // Scan network
//       //  home: MyAppWiFiScan(), // Scan network
//       // home: ConnectToWiFi(), // Connect to SSiD
//       // home: WiFiSearchPage(), // List of Cards
//     );
//   }
// }
