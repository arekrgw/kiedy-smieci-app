import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kiedy_smieci_app/models/garbageDate.dart';
import 'package:kiedy_smieci_app/models/garbageRegion.dart';
import 'package:kiedy_smieci_app/models/garbageType.dart';

class GarbageServer {
  static final String API_URL = "http://kiedysmieciv2.herokuapp.com";
  static Future<List<GarbageDate>> getDates(String id) async {
    final response = await http.get('$API_URL/dates/$id');
    if(response.statusCode == 200) {
      return (json.decode(response.body) as List).map((e) => GarbageDate.fromJson(e)).toList();
    }
    else {
      throw Exception("Failed to load GarbageDates for $id");
    }
  }

  static Future<List<GarbageRegion>> getRegions() async {
    final response = await http.get('$API_URL/regions');
    if(response.statusCode == 200) {
      return (json.decode(response.body) as List).map((e) => GarbageRegion.fromJson(e)).toList();
    }
    else {
      throw Exception("Failed to load GarbageRegions");
    }
  }

  static Future<GarbageRegion> getRegion(String id) async {
    final response = await http.get('$API_URL/regions/$id');
    if(response.statusCode == 200) {
      return GarbageRegion.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("Failed to load GarbageRegion");
    }
  }

  static Future<List<GarbageType>> getTypes() async {
    final response = await http.get('$API_URL/types');
    if(response.statusCode == 200) {
      return (json.decode(response.body) as List).map((e) => GarbageType.fromJson(e)).toList();
    }
    else {
      throw Exception("Failed to load GarbageTypes");
    }
  }
}