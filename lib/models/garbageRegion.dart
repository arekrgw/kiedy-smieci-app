import 'package:kiedy_smieci_app/models/garbageCity.dart';
import 'package:kiedy_smieci_app/api/sharedPreferences.dart';

class GarbageRegion {
  final String id;
  final String regionName;
  final GarbageCity city;
  final String postalCode;
  bool favourite = false;

  GarbageRegion({this.id, this.regionName, this.city, this.postalCode, this.favourite = false});

  void toggleFavourites() {
    favourite = !favourite;
    GarbageLocalStorage.toggleFavourite(this);
    //save shared pref
  }


  factory GarbageRegion.fromJson(Map<String, dynamic> json) => GarbageRegion(
        id: json['_id'],
        regionName: json['regionName'],
        city: GarbageCity.fromJson(json['city']),
        postalCode: json['postalCode'],
      );
}
