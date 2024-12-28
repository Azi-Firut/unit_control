// import 'package:flutter/material.dart';
// import 'package:android_intent_plus/android_intent.dart';
//
// void connectToWifi(String ssid, String password) async {
//   final AndroidIntent intent = AndroidIntent(
//     action: 'android.net.wifi.PICK_WIFI_NETWORK',
//     package: 'com.android.settings',
//   );
//   intent.category!;
//   intent.action('a')
//   // Добавляем параметры SSID и password для автоматического заполнения
//   // intent.extra('android.provider.extra.WIFI_SSID', ssid);
//   // intent.extra('android.provider.extra.WIFI_PASSWORD', password);
//
//   await intent.launch();
//
// }
//
// class MyZApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Connect to Wi-Fi'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               // Замените 'YourSSID' и 'YourPassword' на актуальные значения
//               connectToWifi('RESEPI-5FFA1F', 'LidarAndINS');
//             },
//             child: Text('Connect to Wi-Fi'),
//           ),
//         ),
//       ),
//     );
//   }
// }
