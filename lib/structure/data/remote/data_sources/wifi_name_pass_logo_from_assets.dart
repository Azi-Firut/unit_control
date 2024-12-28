import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:unit_control/structure/data/remote/models/wifi_name_pass_logo_model.dart';

/// get ssids logos and pass from local Json
Future<List<SsidsFromUrl>> loadSsidsJsonFromAsset() async {
  final String jsonString =
      await rootBundle.loadString('assets/ssids_from_url.json');
  final data = json.decode(jsonString);
  return data.map<SsidsFromUrl>((json) => SsidsFromUrl.fromJson(json)).toList();
}
