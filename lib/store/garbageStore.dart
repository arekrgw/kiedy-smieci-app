import 'package:kiedy_smieci_app/api/garbageLocalStorage.dart';
import 'package:kiedy_smieci_app/models/garbageDateAggreagated.dart';
import 'package:kiedy_smieci_app/models/garbageRegion.dart';
import 'package:mobx/mobx.dart';
import '../models/garbageDate.dart';
import '../api/garbageServer.dart';

part 'garbageStore.g.dart';

class GarbageStore = _GarbageStore with _$GarbageStore;

abstract class _GarbageStore with Store {
  List<GarbageDate> rawDates = [];
  @observable
  List<GarbageRegion> regions = [];
  List<GarbageDateAggregated> aggregatedDates = [];

  @observable
  ObservableFuture<List<GarbageDate>> fetchDatesFuture =
      ObservableFuture.value([]);

  @action
  Future<List<GarbageDateAggregated>> fetchDates(String id) async {
    rawDates = [];
    final future = GarbageServer.getDates(id);
    fetchDatesFuture = ObservableFuture(future);
    rawDates = await fetchDatesFuture;
    rawDates.sort((a, b) => a.date.compareTo(b.date));

    DateTime current;
    int aggIndex = -1;
    for (int i = 0; i < rawDates.length; ++i) {
      if (current != rawDates[i].date) {
        aggregatedDates.add(GarbageDateAggregated(
            date: rawDates[i].date, region: rawDates[i].region));
        current = rawDates[i].date;
        aggIndex++;
      }
      aggregatedDates[aggIndex].types.add(rawDates[i].type);
    }
    return aggregatedDates;
  }

  @computed
  int get closestDate {
    for (int i = 0; i < aggregatedDates.length; ++i) {
      if (aggregatedDates[i].date.isAfter(DateTime.now())) {
        return i;
      }
    }
    return 0;
  }

  @observable
  ObservableFuture<List<GarbageRegion>> fetchRegionsFuture =
      ObservableFuture.value([]);

  @action
  Future<List<GarbageRegion>> fetchRegions() async {
    regions = [];
    final future = GarbageServer.getRegions();
    fetchRegionsFuture = ObservableFuture(future);
    List<GarbageRegion> tempRegions = await fetchRegionsFuture;

    List<String> favouriteRegionsIds =
        await GarbageLocalStorage.getFavourites();
        print(favouriteRegionsIds);
    for (var region in tempRegions) {
      if (favouriteRegionsIds.contains(region.id)) region.favourite = true;
    }

    return regions = tempRegions;
  }

  @action
  void updateRegionFavourite(GarbageRegion region) {
    region.toggleFavourites();
    regions = [...regions];
  }
}
