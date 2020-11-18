class GarbageType {
  final String id;
  final String type;

  GarbageType({this.id, this.type});

  factory GarbageType.fromJson(Map<String, dynamic> json) => GarbageType(id: json['_id'], type: json['type']);
}