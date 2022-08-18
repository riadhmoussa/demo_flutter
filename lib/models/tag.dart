import 'dart:convert';

class Tag {
  Tag({
    required this.id,
    required this.name,
  });

  int? id;
  String? name;

  factory Tag.fromJson(Map<String, dynamic>? json) => Tag(
    id: json?["id"],
    name: json?["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}