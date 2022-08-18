import 'dart:convert';

import 'package:flutter_demo/models/tag.dart';
import 'package:flutter_demo/models/category_model.dart';

List<Pet> listPetsFromJson(String str) => List<Pet>.from(json.decode(str).map((x) => Pet.fromJson(x)));

String listPetsToJson(List<Pet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pet {
  Pet({
    required this.id,
    required this.category,
    required this.name,
    required this.photoUrls,
    required this.tags,
    required this.status,
  });

  int id;
  CategoryModel category;
  String? name;
  List<String> photoUrls;
  List<Tag> tags;
  String status;

  factory Pet.fromJson(Map<String, dynamic>? json) => Pet(
    id: json?["id"] as int,
    category:  CategoryModel.fromJson(json?["category"]),
    name: json?["name"] == null ?"": json?["name"]as String,
    photoUrls: json?["photoUrls"] == null ?[]:List<String>.from(json?["photoUrls"].map((x) => x)),
    tags: List<Tag>.from(json?["tags"].map((x) => Tag.fromJson(x))),
    status: json?["status"] as String,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category.toJson(),
    "name": name,
    "photoUrls": List<dynamic>.from(photoUrls.map((x) => x)),
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "status": status,
  };
}


