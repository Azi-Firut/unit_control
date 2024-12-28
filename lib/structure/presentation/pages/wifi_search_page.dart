import 'dart:async';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unit_control/structure/data/remote/models/wifi_name_pass_logo_model.dart';
import 'package:unit_control/structure/presentation/widgets/wifi_unit_card.dart';
import 'package:wifi_scan/wifi_scan.dart';
import '../../../constant.dart';
import '../../data/remote/data_sources/wifi_name_pass_logo_from_assets.dart';
import 'package:wiflutter/wiflutter.dart';

class MyAppWiFiScan extends StatefulWidget {
  const MyAppWiFiScan({Key? key}) : super(key: key);

  @override
  State<MyAppWiFiScan> createState() => _MyAppWiFiScanState();
}

class _MyAppWiFiScanState extends State<MyAppWiFiScan> {
  /// ============== init vars
  List<WiFiAccessPoint> accessPoints = <WiFiAccessPoint>[];
  StreamSubscription<List<WiFiAccessPoint>>? subscription;

  List<SsidsFromUrl> listOfMapsParsedSSiDSandPass = [];
  List<int> indexOfsearchedElement = [];
  List<WiFiAccessPoint> listOfScannedWiFi = [];
  List<Map<String, dynamic>> matchingList = [];
  List<Map<String, dynamic>> matchingResults = [];

  bool shouldCheckCan = true;
  bool get isStreaming => subscription != null;
  // String wifi = "";

  ///============== function to auto wifi connect / disconnect
  @override
  initState() {
    super.initState();
    // test();
    // wifiOnOff();
    canGetScannedResults(context); //==== нужно переписать
    print("-------------- Start ListeningToScanResults ");
    startListeningToScanResults(context);
    print("-------------- Start scan ");
    startScan(context);
  }

  final WiFlutter wifiConnectDisconnect = WiFlutter();
  // test() {
  //   wifiConnectDisconnect.setWifiEnabled(true);
  // }
  // Future<void> wifiOnOff() async {
  //   await _wifiConnectDisconnect.setWifiEnabled(true);
  //   print("----911---------${await _wifiConnectDisconnect.isWifiEnabled()}");
  //   wifi = "and WiFi";
  // }

  ///
  void clearAllVariables() {
    matchingList.clear();
    matchingResults.clear();
    indexOfsearchedElement.clear();
    listOfMapsParsedSSiDSandPass.clear();
  }

  ///================  start / stop listening
  Future<void> startListeningToScanResults(BuildContext context) async {
    subscription = WiFiScan.instance.onScannedResultsAvailable.listen(
      (result) {
        setState(() {
          accessPoints = result;
        });
      },
    );
    print("startListeningToScanResults---------$accessPoints");
  }

  Future<bool> canGetScannedResults(BuildContext context) async {
    if (shouldCheckCan) {
      final can = await WiFiScan.instance.canGetScannedResults();
      // if can-not, then show error
      if (can != CanGetScannedResults.yes) {
        if (mounted) kShowSnackBar(context, "Cannot get scanned results: $can");
        accessPoints = <WiFiAccessPoint>[];
        return false;
      }
    }
    return true;
  }

  Future<void> getScannedResults(BuildContext context) async {
    final results = await WiFiScan.instance.getScannedResults();
    setState(() => accessPoints = results);
    print("getScannedResults---------$results");
  }

  ///

  Future<void> startScan(BuildContext context) async {
    print("-------------- startScan");
    clearAllVariables();
    getScannedResults(context);

    ///= get List of scanned WiFi

    final result = await WiFiScan.instance.startScan();
    print('result --------------- $result');
    listOfScannedWiFi = await WiFiScan.instance.getScannedResults();
    print(listOfScannedWiFi);

    ///= get Json list of maps from url (name,logo,pass)
    // listOfMapsParsedSSiDSandPass = await fetchSsidsFromUrl(http.Client());
    listOfMapsParsedSSiDSandPass = await loadSsidsJsonFromAsset();
    List<String> createNamesList(List<SsidsFromUrl> data) {
      List<String> namesList = [];
      for (var item in data) {
        namesList.add(item.name);
      }
      return namesList;
    }

    var listOfSearchedSSIDnames = createNamesList(listOfMapsParsedSSiDSandPass);
    print(listOfMapsParsedSSiDSandPass);
    print(listOfSearchedSSIDnames);

    ///=================================
    for (int i = 0; i < listOfSearchedSSIDnames.length; i++) {
      String searchedElement = listOfSearchedSSIDnames[i];
      print('searchedElement  ===== $searchedElement ');

      for (int j = 0; j < listOfScannedWiFi.length; j++) {
        String element = listOfScannedWiFi[j].ssid.split(ssidDivider)[0];
        // print('element  ===== $element');
        if (element == searchedElement) {
          indexOfsearchedElement
              .add(listOfSearchedSSIDnames.indexOf(searchedElement));
          print('indexOfsearchedElement  ===== $indexOfsearchedElement');

          matchingList.add({
            'searchedString': searchedElement,
            'originalSSID': listOfScannedWiFi[j].ssid,
            'index': j,
            'bssid': listOfScannedWiFi[j].bssid,
          });
          print('matchingList  ===== $matchingList');
        }
      }
      if (matchingList.isNotEmpty) {
        // Add to matchingResults only if there are matches
        matchingResults.addAll(matchingList);
      }
    }

    // call startScan API
    if (mounted) {
      kShowSnackBar(context, "Found: ${accessPoints.length} access points");
    }

    setState(() {
      matchingList;
      accessPoints = <WiFiAccessPoint>[];
    });
  }

  ///=====
  // Future<void> _getScannedResults(BuildContext context) async {
  //   print("--------------_getScannedResults");
  //   //if (await _canGetScannedResults(context)) {
  //   /// = get List of scanned WiFi2 (original version)
  //   final results = await WiFiScan.instance.getScannedResults();
  //
  //   setState(() {
  //     accessPoints = results;
  //   });
  //   // }
  // }

  void stopListeningToScanResults() {
    subscription?.cancel();
    setState(() => subscription = null);
  }

  ///==================================
  @override // stop subscription for scanned results
  void dispose() {
    super.dispose();
    stopListeningToScanResults();
  }

  // @override
  // initState() {
  //   super.initState();
  //   print("-------------- Start ListeningToScanResults ");
  //   _startListeningToScanResults(context);
  //   print("-------------- Start scan ");
  //   _startScan(context);
  // }

  ////////////////////////////////////////////////////////////////////////////   Body

  @override
  Widget build(BuildContext context) {
    print('listOfMapsParsedSSiDSandPass------$listOfMapsParsedSSiDSandPass');
    print('indexOfsearchedElement------$indexOfsearchedElement');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.black,
          elevation: 10,
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
            systemStatusBarContrastEnforced: false,
            statusBarBrightness: Brightness.dark,
            statusBarColor: appStatusBarColor,
            systemNavigationBarIconBrightness: Brightness.light,
            systemNavigationBarColor: appSystemNavigationBarColor,
            systemNavigationBarContrastEnforced: false,
            statusBarIconBrightness:
                Brightness.light, // For Android (dark icons)
            // statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          backgroundColor: appAppBar,
          title: Text(
              style: const TextStyle(color: bgColorGrey),
              textScaleFactor: 0.7,
              'Scanned ${accessPoints.length} access points'),
        ),
        body: Builder(
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ------------- Refresh
              Flexible(
                child: RefreshIndicator(
                  onRefresh: () async {
                    //wifiOnOff();
                    clearAllVariables();
                    startListeningToScanResults(context);
                    startScan(context);
                    //   _getScannedResults(context);
                  },
                  child: Center(
                    child: matchingList.isEmpty
                        ? Center(
                            child: ListView(
                              children: const [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 30.0),
                                      child: Text("Unit not found "),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 30.0),
                                      child: Text(
                                        "Turn ON the Unit and WiFi\nSwipe screen to the bottom",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: matchingList.length,
                            itemBuilder: (context, i) {
                              return UnitCardWiFi(
                                accessPoints: matchingList[i],
                                index: i,
                                jsonMap: listOfMapsParsedSSiDSandPass,
                                indexOfsearchedElement:
                                    indexOfsearchedElement[i],
                              );
                            },
                          ),
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

/// Show snackbar.
void kShowSnackBar(BuildContext context, String message) {
  if (kDebugMode) print(message);
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Center(child: Text(message))));
}
