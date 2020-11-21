import 'package:kiedy_smieci_app/models/garbageCity.dart';

class GarbageRegion {
  final String id;
  final String regionName;
  final GarbageCity city;
  final String postalCode;

  GarbageRegion({this.id, this.regionName, this.city, this.postalCode});

  factory GarbageRegion.fromJson(Map<String, dynamic> json) => GarbageRegion(
        id: json['_id'],
        regionName: json['regionName'],
        city: GarbageCity.fromJson(json['city']),
        postalCode: json['postalCode'],
      );
}
