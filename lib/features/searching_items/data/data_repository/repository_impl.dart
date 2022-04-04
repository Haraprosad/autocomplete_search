import 'dart:convert';

import 'package:autocomplete_search/features/searching_items/data/model/item_model.dart';
import 'package:dio/dio.dart';

class UserApi {
  static Future<List<Item>> getUserSuggestions(String query) async {
    Dio _dio = Dio();
    const url = 'https://jsonplaceholder.typicode.com/users';
    final response = await _dio.get(url);

    if (response.statusCode == 200) {
      final List users = response.data;
      return users.map((json) => Item.fromJson(json)).where((user) {
        final nameLower = user.name.toLowerCase();
        final queryLower = query.toLowerCase();
        return nameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}