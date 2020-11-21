import 'package:intl/intl.dart';
import 'package:kiedy_smieci_app/models/garbageRegion.dart';

import './garbageType.dart';

class GarbageDate {
  final String id;
  final DateTime date;
  final GarbageType type;
  final GarbageRegion region;

  GarbageDate({this.id, this.date, this.type, this.region});

  String get formattedDate => DateFormat("dd-MM-yyyy").format(date);

  factory GarbageDate.fromJson(Map<String, dynamic> json) => GarbageDate(
        id: json['_id'],
        date: DateTime.parse(json['date']),
        type: GarbageType.fromJson(json['garbageType']),
        region: GarbageRegion.fromJson(json['garbageRegion']),
      );
}
