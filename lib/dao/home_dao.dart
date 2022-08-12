import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_xiecheng/model/home_model.dart';

const HOME_URL = 'http://rap2api.taobao.org/app/mock/305633/xiecheng-flutter/home/get-tabs';
// Request
class HomeDao {
  static Future<HomeModel> fetch() async {
    final response = await http.get(Uri.parse(HOME_URL));
    if (response.statusCode == 200) {
      var result = jsonDecode(utf8.decode((response.bodyBytes)));
      return HomeModel.fromJson(result);
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}