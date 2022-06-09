import 'dart:convert';

Quote quoteFromJson(String str) => Quote.fromJson(json.decode(str));

String quoteToJson(Quote data) => json.encode(data.toJson());

class Quote {
  Quote({
    required this.quote,
    required this.athor,
    required this.imgPath,
  });

  late String quote;
  late String athor;
  late String imgPath;

  Quote.fromJson(Map<String, dynamic> json) {
    quote = json["quote"];
    athor = json["athor"];
    imgPath = json["imgPath"];
  }

  Map<String, dynamic> toJson() => {
        "quote": quote,
        "athor": athor,
        "imgPath": imgPath,
      };
}
