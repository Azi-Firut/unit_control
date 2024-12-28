class SsidsFromUrl {
  final String name;
  final String pass;
  final String logo;

  const SsidsFromUrl({
    required this.name,
    required this.pass,
    required this.logo,
  });

  factory SsidsFromUrl.fromJson(Map<String, dynamic> json) {
    return SsidsFromUrl(
      name: json['name'] as String,
      pass: json['pass'] as String,
      logo: json['logo'] as String,
    );
  }
}
