import 'package:mobx/mobx.dart';
import '../models/garbageDate.dart';
import '../api/garbageServer.dart';

part 'garbageStore.g.dart';

class GarbageStore = _GarbageStore with _$GarbageStore;

abstract class _GarbageStore with Store {
  List<GarbageDate> dates = [];

  @observable
  ObservableFuture<List<GarbageDate>> fetchDatesFuture = ObservableFuture.value([]);

  @action
  Future<List<GarbageDate>> fetchDates(String id) async {
    dates = [];
    final future = GarbageServer.getDates(id);
    fetchDatesFuture = ObservableFuture(future);

    return dates = await fetchDatesFuture;
  }
}
