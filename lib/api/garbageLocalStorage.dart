import 'package:shared_preferences/shared_preferences.dart';
import 'package:kiedy_smieci_app/models/garbageRegion.dart';

class GarbageLocalStorage {
  static Future<SharedPreferences> initPref() async {
    return await SharedPreferences.getInstance();
  }

  static Future<List<String>> getFavourites() async {
    try {
      List<String> temp = (await initPref()).getStringList('favourites');
      return temp != null ? temp : [];
    }
    catch(e) {
      print("err");
      return [];
    }
  }

  static void setFavourites(List<String> favs) async {
    try {
      (await initPref()).setStringList('favourites', favs);
    }
    catch(e) {
      print("Err");
    }
  }


  static void toggleFavourite(GarbageRegion region) async {
    List<String> favs = await getFavourites();
    if(!favs.contains(region.id)) favs.add(region.id);
    else favs.removeWhere((element) => element == region.id);
    print(favs);
    setFavourites(favs);
  }

}
