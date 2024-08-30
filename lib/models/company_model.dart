import 'dart:convert';

class CompanyModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;
  bool? isApplied;

  CompanyModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
    this.isApplied,
  });

  factory CompanyModel.fromRawJson(String str) =>
      CompanyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
