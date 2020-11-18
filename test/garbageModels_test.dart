import 'package:flutter_test/flutter_test.dart';
import 'package:kiedy_smieci_app/models/garbageDate.dart';

void main() {
  group("GarbageDateTest", () {
    final mockJson = {
      "_id": "5f2463da4d732d001768aab8",
      "garbageType": {
        "_id": "5f245dd64d732d001768a9c7",
        "type": "papier",
      },
      "garbageRegion": {
        "_id": "5f245dd64d732d001768a9c5",
        "regionName": "Rogów",
        "hours": "6-15",
        "city": "5f245dd64d732d001768a9c4",
      },
      "date": "2020-08-03T00:00:00.000+00:00",
      "dateObjectHash": "6965009ba06ef45436592462adee8a50161ad487"
    };
    test("factory from json check", () {
      final date = GarbageDate.fromJson(mockJson);

      expect(date.date.toString(), '2020-08-03 00:00:00.000Z');
      expect(date.type.type, "papier");
    });
    test("correctly formats date", () {
      final date = GarbageDate.fromJson(mockJson);
      expect(date.formattedDate, "03-08-2020");
    });
  });
}
