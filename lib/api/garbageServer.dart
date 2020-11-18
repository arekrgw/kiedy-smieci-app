import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kiedy_smieci_app/models/garbageDate.dart';

class GarbageServer {
  static Future<List<GarbageDate>> getDates(String id) async {
    final response = await http.get('http://kiedysmieciv2.herokuapp.com/dates/$id');
    if(response.statusCode == 200) {
      return (json.decode(response.body) as List).map((e) => GarbageDate.fromJson(e)).toList();
    }
    else {
      throw Exception("Failed to load GarbageDates for $id");
    }
  }
}