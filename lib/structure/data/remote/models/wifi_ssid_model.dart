class SsidsFromUrl {
  final String name;
  final String pass;
  final String url;

  const SsidsFromUrl({
    required this.name,
    required this.pass,
    required this.url,
  });

  factory SsidsFromUrl.fromJson(Map<String, dynamic> json) {
    return SsidsFromUrl(
      name: json['name'] as String,
      pass: json['pass'] as String,
      url: json['url'] as String,
    );
  }
}
