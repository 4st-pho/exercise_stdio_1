import 'dart:convert';

Quote quoteFromJson(String str) => Quote.fromJson(json.decode(str));

String quoteToJson(Quote data) => json.encode(data.toJson());

class Quote {
  const Quote({
    required this.quote,
    required this.athor,
    required this.imgPath,
  });

  final String quote;
  final String athor;
  final String imgPath;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        quote: json["quote"],
        athor: json["athor"],
        imgPath: json["imgPath"],
      );

  Map<String, dynamic> toJson() => {
        "quote": quote,
        "athor": athor,
        "imgPath": imgPath,
      };
}
