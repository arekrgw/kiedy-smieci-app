class GarbageCity {
  final String id;
  final String cityName;
  final String province;

  GarbageCity({this.id, this.cityName, this.province});

  factory GarbageCity.fromJson(Map<String, dynamic> json) => GarbageCity(
        id: json['_id'],
        cityName: json['cityName'],
        province: json['province'],
      );
}
