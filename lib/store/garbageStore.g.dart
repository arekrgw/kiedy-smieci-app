// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garbageStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GarbageStore on _GarbageStore, Store {
  Computed<int> _$closestDateComputed;

  @override
  int get closestDate =>
      (_$closestDateComputed ??= Computed<int>(() => super.closestDate,
              name: '_GarbageStore.closestDate'))
          .value;

  final _$regionsAtom = Atom(name: '_GarbageStore.regions');

  @override
  List<GarbageRegion> get regions {
    _$regionsAtom.reportRead();
    return super.regions;
  }

  @override
  set regions(List<GarbageRegion> value) {
    _$regionsAtom.reportWrite(value, super.regions, () {
      super.regions = value;
    });
  }

  final _$fetchDatesFutureAtom = Atom(name: '_GarbageStore.fetchDatesFuture');

  @override
  ObservableFuture<List<GarbageDate>> get fetchDatesFuture {
    _$fetchDatesFutureAtom.reportRead();
    return super.fetchDatesFuture;
  }

  @override
  set fetchDatesFuture(ObservableFuture<List<GarbageDate>> value) {
    _$fetchDatesFutureAtom.reportWrite(value, super.fetchDatesFuture, () {
      super.fetchDatesFuture = value;
    });
  }

  final _$fetchRegionsFutureAtom =
      Atom(name: '_GarbageStore.fetchRegionsFuture');

  @override
  ObservableFuture<List<GarbageRegion>> get fetchRegionsFuture {
    _$fetchRegionsFutureAtom.reportRead();
    return super.fetchRegionsFuture;
  }

  @override
  set fetchRegionsFuture(ObservableFuture<List<GarbageRegion>> value) {
    _$fetchRegionsFutureAtom.reportWrite(value, super.fetchRegionsFuture, () {
      super.fetchRegionsFuture = value;
    });
  }

  final _$fetchDatesAsyncAction = AsyncAction('_GarbageStore.fetchDates');

  @override
  Future<List<GarbageDateAggregated>> fetchDates(String id) {
    return _$fetchDatesAsyncAction.run(() => super.fetchDates(id));
  }

  final _$fetchRegionsAsyncAction = AsyncAction('_GarbageStore.fetchRegions');

  @override
  Future<List<GarbageRegion>> fetchRegions() {
    return _$fetchRegionsAsyncAction.run(() => super.fetchRegions());
  }

  final _$_GarbageStoreActionController =
      ActionController(name: '_GarbageStore');

  @override
  void updateRegionFavourite(GarbageRegion region) {
    final _$actionInfo = _$_GarbageStoreActionController.startAction(
        name: '_GarbageStore.updateRegionFavourite');
    try {
      return super.updateRegionFavourite(region);
    } finally {
      _$_GarbageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
regions: ${regions},
fetchDatesFuture: ${fetchDatesFuture},
fetchRegionsFuture: ${fetchRegionsFuture},
closestDate: ${closestDate}
    ''';
  }
}
