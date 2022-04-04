import 'dart:convert';

class Item {
  final String name;

  const Item({
    required this.name,
  });

  // static Item fromJson(Map<String, dynamic> json) => Item(
  //   name: json['name'],
  // );
  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json["name"],
  );
}

// List<ItemModel> itemModelFromJson(String str) => List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));
//
// class ItemModel {
//   ItemModel({
//     this.name,
//   });
//
//   String? name;
//
//
//   factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
//     name: json["name"],
//   );
// }