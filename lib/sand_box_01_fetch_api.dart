import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unit_control/structure/presentation/widgets/wifi_unit_card.dart';

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get(Uri.parse(
      'https://raw.githubusercontent.com/Azi-Firut/unit_control/master/SSIDS.json'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  // final int albumId;
  // final int id;
  final String name;
  final String url;
  //final String thumbnailUrl;

  const Photo({
    // required this.albumId,
    // required this.id,
    required this.name,
    required this.url,
    // required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      // albumId: json['albumId'] as int,
      // id: json['id'] as int,
      name: json['name'] as String,
      url: json['url'] as String,
      //  thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

//////// widgets

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot);
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            print("---------------Snapshot data NOT EMPTY");
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({super.key, required this.photos});

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    print(photos.length);
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return UnitCardWiFi(
          unitImage: photos[index].url,
          unitSsid: photos[index].name,
        );
      },
    );
    // return GridView.builder(
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 1,
    //   ),
    //   itemCount: photos.length,
    //   itemBuilder: (context, index) {
    //     print(photos[index].url);
    //     print(photos[index].name);
    //     //return UnitCardWiFi(photos[index].url);
    //     return UnitCardWiFi(
    //       unitImage: photos[index].url,
    //       unitSsid: photos[index].name,
    //     );
    //   },
    // );
  }
}
// photos[index].url
