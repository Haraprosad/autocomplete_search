import 'dart:convert';

import 'package:autocomplete_search/features/searching_items/data/model/item_model.dart';
import 'package:dio/dio.dart';

class UserApi {
  static Future<List<ItemsModel>> getUserSuggestions(String query) async {
    Dio _dio = Dio();
    const url = 'https://jsonplaceholder.typicode.com/users';
    final response = await _dio.get(url,options: Options(
      responseType: ResponseType.plain, //for getting respose as string
    ),);
    if (response.statusCode == 200) {
      return itemsModelFromJson(response.data);
    } else {
      throw Exception();
    }
  }
}