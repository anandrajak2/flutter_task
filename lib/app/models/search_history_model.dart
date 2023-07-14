// To parse this JSON data, do
//
//     final searchHistoryModel = searchHistoryModelFromJson(jsonString);

import 'dart:convert';

List<SearchHistoryModel> searchHistoryModelFromJson(String str) =>
    List<SearchHistoryModel>.from(
        json.decode(str).map((x) => SearchHistoryModel.fromJson(x)));

String searchHistoryModelToJson(List<SearchHistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchHistoryModel {
  final int id;
  final String name;

  SearchHistoryModel({
    required this.id,
    required this.name,
  });

  factory SearchHistoryModel.fromJson(Map<String, dynamic> json) =>
      SearchHistoryModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
