import 'dart:convert';

ImageToTextEntity imageToTextEntityFromJson(String str) =>
    ImageToTextEntity.fromJson(json.decode(str));

String imageToTextEntityToJson(ImageToTextEntity data) =>
    json.encode(data.toJson());

class ImageToTextEntity {
  ImageToTextEntity({
    required this.lang,
    required this.allText,
    required this.annotations,
  });

  String lang;
  String allText;
  List<String> annotations;

  factory ImageToTextEntity.fromJson(Map<String, dynamic> json) =>
      ImageToTextEntity(
        lang: json["lang"],
        allText: json["all_text"],
        annotations: List<String>.from(json["annotations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "lang": lang,
        "all_text": allText,
        "annotations": List<dynamic>.from(annotations.map((x) => x)),
      };
}
