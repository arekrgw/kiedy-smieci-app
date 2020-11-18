import 'package:intl/intl.dart';

import './garbageType.dart';

class GarbageDate {
  final String id;
  final DateTime date;
  final GarbageType type;

  GarbageDate({this.id, this.date, this.type});

  String get formattedDate => DateFormat("dd-MM-yyyy").format(date);

  factory GarbageDate.fromJson(Map<String, dynamic> json) {
    return GarbageDate(id: json['_id'], date: DateTime.parse(json['date']), type: GarbageType.fromJson(json['garbageType']));
  }
}
