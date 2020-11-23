import 'package:kiedy_smieci_app/models/garbageDateAggreagated.dart';
import 'package:kiedy_smieci_app/models/garbageRegion.dart';
import 'package:mobx/mobx.dart';
import '../models/garbageDate.dart';
import '../api/garbageServer.dart';

part 'garbageStore.g.dart';

class GarbageStore = _GarbageStore with _$GarbageStore;

abstract class _GarbageStore with Store {
  List<GarbageDate> dates = [];
  List<GarbageRegion> regions = [];

  @observable
  ObservableFuture<List<GarbageDate>> fetchDatesFuture = ObservableFuture.value([]);

  @action
  Future<List<GarbageDate>> fetchDates(String id) async {
    dates = [];
    final future = GarbageServer.getDates(id);
    fetchDatesFuture = ObservableFuture(future);
    dates = await fetchDatesFuture;
    dates.sort((a, b) => a.date.compareTo(b.date));

    return dates;
  }

  @computed
  List<GarbageDateAggregated> get aggregatedDates {
    List<GarbageDateAggregated> aggDates = [];
    DateTime current;
    int aggIndex = -1;
    for(int i = 0; i<dates.length; ++i) {
      if(current != dates[i].date) {
        aggDates.add(GarbageDateAggregated(date: dates[i].date, region: dates[i].region));
        current = dates[i].date;
        aggIndex++;
      }
      aggDates[aggIndex].types.add(dates[i].type);
    }

    return aggDates;
  }

  @computed
  int get closestDate {
    for(int i = 0; i<aggregatedDates.length; ++i) {
      if(aggregatedDates[i].date.isAfter(DateTime.now())){
        return i;
      }
    }
    return 0;
  }

  @observable
  ObservableFuture<List<GarbageRegion>> fetchRegionsFuture = ObservableFuture.value([]);

  @action
  Future<List<GarbageRegion>> fetchRegions() async {
    regions = [];
    final future = GarbageServer.getRegions();
    fetchRegionsFuture = ObservableFuture(future);

    return regions = await fetchRegionsFuture;
  }
}
