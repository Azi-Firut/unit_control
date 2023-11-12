import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:unit_control/structure/data/remote/models/wifi_ssid_model.dart';

Future<List<SsidsFromUrl>> fetchSsidsFromUrl(http.Client client) async {
  final response = await client.get(Uri.parse(
      'https://raw.githubusercontent.com/Azi-Firut/unit_control/master/SSIDS.json'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseSsidFromUrl, response.body);
}

// A function that converts a response body into a List<Photo>.
List<SsidsFromUrl> parseSsidFromUrl(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed
      .map<SsidsFromUrl>((json) => SsidsFromUrl.fromJson(json))
      .toList();
}
