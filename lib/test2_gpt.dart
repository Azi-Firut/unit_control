import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_scan/wifi_scan.dart';

import 'constant.dart';

// class MyAppWiFiScan extends StatefulWidget {
//   const MyAppWiFiScan({Key? key}) : super(key: key);
//
//   @override
//   State<MyAppWiFiScan> createState() => _MyAppWiFiScanState();
// }
//
// class _MyAppWiFiScanState extends State<MyAppWiFiScan> {
//   var accessPoints = <int, List<Map<String, dynamic>>>{};
//   StreamSubscription<List<WiFiAccessPoint>>? subscription;
//   bool shouldCheckCan = true;
//
//   @override
//   void initState() {
//     getScannedResults();
//     super.initState();
//   }
//
//   Future<bool> _canGetScannedResults() async {
//     await WiFiScan.instance.canGetScannedResults();
//     return true;
//   }
//
//   Future<void> getScannedResults() async {
//     if (await _canGetScannedResults()) {
//       final results = await WiFiScan.instance.getScannedResults();
//
//       List<String> list1 = [
//         'FLIGHTS',
//         'RESEPI',
//         'DIRECT',
//         'The Mystery Machine'
//       ];
//
//       Map<int, List<Map<String, dynamic>>> matchingResults = {};
//
//       for (int i = 0; i < list1.length; i++) {
//         String searchedElement = list1[i];
//         List<Map<String, dynamic>> matchingList = [];
//
//         for (int j = 0; j < results.length; j++) {
//           String element = results[j].ssid.split('-')[0];
//           if (element == searchedElement) {
//             matchingList.add({
//               'searchedString': searchedElement,
//               'originalSSID': results[j].ssid,
//               'index': j,
//             });
//           }
//         }
//
//         if (matchingList.isNotEmpty) {
//           matchingResults[i] = matchingList;
//           print("------------------");
//           print(matchingList.length);
//           print(matchingResults[i]);
//           print("------------------");
//         }
//       }
//
//       setState(() {
//         accessPoints = matchingResults;
//       });
//     }
//   }
//
//   void stopListeningToScanResults() {
//     subscription?.cancel();
//     setState(() => subscription = null);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     stopListeningToScanResults();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           systemOverlayStyle: const SystemUiOverlayStyle(
//             statusBarColor: appColorGrey,
//             systemNavigationBarIconBrightness: Brightness.light,
//             systemNavigationBarColor: appColorGrey,
//             systemNavigationBarContrastEnforced: false,
//             statusBarIconBrightness: Brightness.light,
//             statusBarBrightness: Brightness.light,
//           ),
//           backgroundColor: appColorGrey,
//         ),
//         body: Builder(
//           builder: (context) => Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Flexible(
//                 child: Center(
//                   child: accessPoints.isEmpty
//                       ? const Text("NO SCANNED RESULTS")
//                       : ListView.builder(
//                           itemCount: accessPoints.length,
//                           itemBuilder: (context, i) {
//                             return UnitCardWiFi2(
//                               accessPoints: accessPoints[i]!,
//                               index: i,
//                             );
//                           },
//                         ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class UnitCardWiFi2 extends StatelessWidget {
//   final List<Map<String, dynamic>> accessPoints;
//   final index;
//
//   UnitCardWiFi2({Key? key, required this.accessPoints, required this.index})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final ap = accessPoints[index];
//     print("UnitCardWiFi2--------${ap['originalSSID']}");
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
//       child: GestureDetector(
//         onTap: () {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Add new Screen rout to Unit GUI')),
//           );
//         },
//         child: Card(
//           shadowColor: Colors.black,
//           elevation: 8,
//           surfaceTintColor: bgColorGrey,
//           color: Colors.white,
//           child: Column(
//             children: [
//               Image.network(
//                 "https://github.com/Azi-Firut/unit_control/blob/master/assets/images/logo/inertial.png?raw=true",
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   ap['originalSSID'].isNotEmpty
//                       ? ap['originalSSID']
//                       : "**EMPTY**",
//                   textScaleFactor: 1.4,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
///==================
// class MyAppWiFiScan extends StatefulWidget {
//   const MyAppWiFiScan({Key? key}) : super(key: key);
//
//   @override
//   State<MyAppWiFiScan> createState() => _MyAppWiFiScanState();
// }
//
// class _MyAppWiFiScanState extends State<MyAppWiFiScan> {
//   var accessPoints = <int, List<Map<String, dynamic>>>{};
//
//   StreamSubscription<List<WiFiAccessPoint>>? subscription;
//   bool shouldCheckCan = true;
//   bool get isStreaming => subscription != null;
//
//   @override
//   void initState() {
//     getScannedResults(context);
//     super.initState();
//   }
//
//   Future<bool> _canGetScannedResults(BuildContext context) async {
//     if (shouldCheckCan) {
//       final can = await WiFiScan.instance.canGetScannedResults();
//
//       return true; // Fixed: Return the actual value of 'can'
//     }
//     return true;
//   }
//
//   Future<void> getScannedResults(BuildContext context) async {
//     if (await _canGetScannedResults(context)) {
//       final results = await WiFiScan.instance.getScannedResults();
//
//       List<String> list1 = [
//         'FLIGHTS',
//         'RESEPI',
//         'DIRECT',
//         'The Mystery Machine'
//       ];
//       final list2 = results;
//
//       Map<int, List<Map<String, dynamic>>> matchingResults = {};
//
//       for (int i = 0; i < list1.length; i++) {
//         String searchedElement = list1[i];
//
//         // Initialize an empty list only if there is a match
//         List<Map<String, dynamic>> matchingList = [];
//
//         for (int j = 0; j < list2.length; j++) {
//           String element = list2[j].ssid.split('-')[0];
//           if (element == searchedElement) {
//             matchingList.add({
//               'searchedString': searchedElement,
//               'originalSSID': list2[j].ssid,
//               'index': j,
//             });
//           }
//         }
//
//         // Add to matchingResults only if there are matches
//         if (matchingList.isNotEmpty) {
//           matchingResults[i] = matchingList;
//           print("------------------");
//           print(matchingList.length);
//           print(matchingResults[i]);
//           print("------------------");
//         }
//       }
//
//       setState(() {
//         accessPoints = matchingResults;
//       });
//     }
//   }
//
//   void stopListeningToScanResults() {
//     subscription?.cancel();
//     setState(() => subscription = null);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     stopListeningToScanResults();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     double rotationSizeChanged = screenWidth;
//     if (screenHeight < screenWidth) {
//       rotationSizeChanged = screenHeight;
//     }
//     print("---------${accessPoints.length}");
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           systemOverlayStyle: const SystemUiOverlayStyle(
//             statusBarColor: appColorGrey,
//             systemNavigationBarIconBrightness: Brightness.light,
//             systemNavigationBarColor: appColorGrey,
//             systemNavigationBarContrastEnforced: false,
//             statusBarIconBrightness:
//                 Brightness.light, // For Android (dark icons)
//             statusBarBrightness: Brightness.light, // For iOS (dark icons)
//           ),
//           backgroundColor: appColorGrey,
//         ),
//         body: Builder(
//           builder: (context) => Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Flexible(
//                 child: Center(
//                   child: accessPoints.length == 0 // not null , maybe empty
//                       ? const Text("NO SCANNED RESULTS")
//                       : ListView.builder(
//                           itemCount: accessPoints.length,
//                           itemBuilder: (context, i) {
//                             return UnitCardWiFi2(
//                               accessPoints: accessPoints[i]!,
//                               index: i,
//                             );
//                           },
//                         ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class UnitCardWiFi2 extends StatelessWidget {
//   final List<Map<String, dynamic>> accessPoints;
//   final index;
//
//   UnitCardWiFi2({Key? key, required this.accessPoints, required this.index})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final ap = accessPoints[index];
//
//     print("UnitCardWiFi2--------${ap['originalSSID']}");
//     return Padding(
//       padding: const EdgeInsets.only(left: 18.0, right: 18, top: 9, bottom: 9),
//       child: GestureDetector(
//         onTap: () {
//           const snackBar =
//               SnackBar(content: Text('Add new Screen rout to Unit GUI'));
//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         },
//         child: Card(
//           shadowColor: Colors.black,
//           elevation: 8,
//           surfaceTintColor: bgColorGrey,
//           color: Colors.white,
//           child: Column(
//             children: [
//               Image.network(
//                   "https://github.com/Azi-Firut/unit_control/blob/master/assets/images/logo/inertial.png?raw=true"),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   ap['originalSSID'].isNotEmpty
//                       ? ap['originalSSID']
//                       : "**EMPTY**",
//                   textScaleFactor: 1.4,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
///===========
import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';

class MyAppWiFiScan extends StatefulWidget {
  const MyAppWiFiScan({Key? key}) : super(key: key);

  @override
  State<MyAppWiFiScan> createState() => _MyAppWiFiScanState();
}

class _MyAppWiFiScanState extends State<MyAppWiFiScan> {
  var accessPoints = <int, List<Map<String, dynamic>>>{};

  StreamSubscription<List<WiFiAccessPoint>>? subscription;
  bool shouldCheckCan = true;
  bool get isStreaming => subscription != null;

  @override
  void initState() {
    getScannedResults(context);
    super.initState();
  }

  Future<bool> _canGetScannedResults(BuildContext context) async {
    if (shouldCheckCan) {
      final can = await WiFiScan.instance.canGetScannedResults();
      // Fixed: Return the actual value of 'can'
    }
    return true;
  }

  Future<void> getScannedResults(BuildContext context) async {
    if (await _canGetScannedResults(context)) {
      final results = await WiFiScan.instance.getScannedResults();

      List<String> list1 = ['Wifi', 'FLIGHTS', 'RESEPI'];
      final list2 = results;

      Map<int, List<Map<String, dynamic>>> matchingResults = {};

      for (int i = 0; i < list1.length; i++) {
        String searchedElement = list1[i];

        // Initialize an empty list only if there is a match
        List<Map<String, dynamic>> matchingList = [];

        for (int j = 0; j < list2.length; j++) {
          String element = list2[j].ssid.split('.')[0];
          if (element == searchedElement) {
            matchingList.add({
              'searchedString': searchedElement,
              'originalSSID': list2[j].ssid,
              'index': j,
            });
          }
        }

        // Add to matchingResults only if there are matches
        if (matchingList.isNotEmpty) {
          matchingResults[i] = matchingList;
          print("------------------");
          print(matchingList.length);
          print(matchingResults[i]);
          print("------------------");
        }
      }

      setState(() {
        accessPoints = matchingResults;
      });
    }
  }

  void stopListeningToScanResults() {
    subscription?.cancel();
    setState(() => subscription = null);
  }

  @override
  void dispose() {
    super.dispose();
    stopListeningToScanResults();
  }

  @override
  Widget build(BuildContext context) {
    print("Build--------");
    print("Build--------$accessPoints");

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Builder(
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Center(
                  child: accessPoints.isEmpty
                      ? const Text("NO SCANNED RESULTS")
                      : ListView.builder(
                          itemCount: accessPoints.length,
                          itemBuilder: (context, i) {
                            return UnitCardWiFi2(
                              accessPoints: accessPoints[i]!,
                              index: i,
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UnitCardWiFi2 extends StatelessWidget {
  final List<Map<String, dynamic>> accessPoints;
  final index;

  UnitCardWiFi2({Key? key, required this.accessPoints, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ap = accessPoints[index];
    print("UnitCardWiFi2--------${accessPoints[index]}");
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, top: 9, bottom: 9),
      child: GestureDetector(
        onTap: () {
          const snackBar =
              SnackBar(content: Text('Add new Screen rout to Unit GUI'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Card(
          shadowColor: Colors.black,
          elevation: 8,
          surfaceTintColor: bgColorGrey,
          color: Colors.white,
          child: Column(
            children: [
              Image.network(
                  "https://github.com/Azi-Firut/unit_control/blob/master/assets/images/logo/wifi.png?raw=true"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ap['originalSSID'].isNotEmpty
                      ? ap['originalSSID']
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
