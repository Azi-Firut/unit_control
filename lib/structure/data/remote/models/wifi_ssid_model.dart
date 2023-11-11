class Beer {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String image_url;

  Beer.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        name = jsonMap['name'],
        tagline = jsonMap['tagline'],
        description = jsonMap['description'],
        image_url = jsonMap['image_url'];
}

class Character {
  int id;
  String name;
  String img;
  String nickname;

  Character.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        img = json['img'],
        nickname = json['nickname'];

  Map toJson() {
    return {'id': id, 'name': name, 'img': img, 'nickname': nickname};
  }
}
