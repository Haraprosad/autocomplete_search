import 'dart:convert';

List<ItemsModel> itemsModelFromJson(String str) => List<ItemsModel>.from(json.decode(str).map((x) => ItemsModel.fromJson(x)));
class ItemsModel {
  ItemsModel({
    this.name,
  });

  String? name;

  factory ItemsModel.fromJson(Map<String, dynamic> json) => ItemsModel(
    name: json["name"]??"name",
  );
}