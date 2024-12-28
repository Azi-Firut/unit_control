import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unit_control/sand_box_web_view.dart';
import 'package:unit_control/sand_box_wifi_on_off.dart';
import 'package:unit_control/sand_box_wifi_scan.dart';
import 'package:unit_control/stock.dart';
import 'package:unit_control/structure/presentation/pages/wifi_search_page.dart';

void main() {
  runApp(MyAppWiFiScan()); //MyAppWiFiScan     // MyApp   // MyAppConnect()
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
}
