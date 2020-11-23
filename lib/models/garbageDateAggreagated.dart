import 'package:kiedy_smieci_app/models/garbageRegion.dart';
import 'package:kiedy_smieci_app/models/garbageType.dart';
import 'package:intl/intl.dart';


class GarbageDateAggregated {
  final DateTime date;
  final GarbageRegion region;
  List<GarbageType> types = [];

  String get formattedDate => DateFormat("dd-MM-yyyy").format(date);
  String get listedTypes {
    String out = "";
    for(int i = 0; i<types.length; ++i) {
      out += types[i].type;
      if(i != types.length - 1) {
        out += ", ";
      }
    }
    return out;
  }

  GarbageDateAggregated({this.date, this.region});

}