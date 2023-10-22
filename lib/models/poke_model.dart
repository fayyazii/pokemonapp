// To parse this JSON data, do
//
//     final pokeModel = pokeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PokeModel pokeModelFromJson(String str) => PokeModel.fromJson(json.decode(str));

String pokeModelToJson(PokeModel data) => json.encode(data.toJson());

class PokeModel {
  int count;
  String next;
  dynamic previous;
  List<Result> results;

  PokeModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokeModel.fromJson(Map<String, dynamic> json) => PokeModel(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  String name;
  String url;

  Result({
    required this.name,
    required this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}
