import 'dart:convert';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
  });

  int? id;
  String? name;

  factory CategoryModel.fromJson(Map<String, dynamic>? json) => CategoryModel(
    id: json?["id"],
    name: json?["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}