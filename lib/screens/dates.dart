import 'package:flutter/material.dart';
import 'package:kiedy_smieci_app/models/garbageRegion.dart';
import 'package:kiedy_smieci_app/store/garbageStore.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DatesScreen extends StatelessWidget {
  static final String routeName = '/dates';

  @override
  Widget build(BuildContext context) {
    GarbageRegion region = ModalRoute.of(context).settings.arguments;
    GarbageStore store = Provider.of<GarbageStore>(context);
    store.fetchDates(region.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "KiedyŚmieci - ${region.regionName}",
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Container(
        child: Observer(
          builder: (_) {
            return store.fetchDatesFuture.status == FutureStatus.fulfilled
                ? ScrollablePositionedList.builder(
                    itemCount: store.aggregatedDates.length,
                    itemBuilder: (BuildContext _, int index) {
                      return ListTile(
                        title: Text(store.aggregatedDates[index].formattedDate),
                        subtitle:
                            Text(store.aggregatedDates[index].listedTypes),
                      );
                    },
                    initialScrollIndex: store.closestDate,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
