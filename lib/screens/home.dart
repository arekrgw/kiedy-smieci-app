import 'package:flutter/material.dart';
import 'package:kiedy_smieci_app/screens/dates.dart';
import 'package:kiedy_smieci_app/store/garbageStore.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Home extends StatelessWidget {
  static final String routeName = '/';

  @override
  Widget build(BuildContext context) {
    GarbageStore store = Provider.of<GarbageStore>(context);
    store.fetchRegions();
    return Scaffold(
      appBar: AppBar(
        title: Text("KiedyŚmieci - Regiony"),
      ),
      body: Container(
        child: Observer(
          builder: (_) {
            return store.fetchRegionsFuture.status == FutureStatus.fulfilled
                ? ListView.builder(
                    itemCount: store.regions.length,
                    itemBuilder: (BuildContext _, int index) {
                      return ListTile(
                        onTap: () => Navigator.pushNamed(
                          context,
                          DatesScreen.routeName,
                          arguments: store.regions[index],
                        ),
                        trailing: GestureDetector(
                          onTap: () => store.updateRegionFavourite(store.regions[index]),
                          child: store.regions[index].favourite
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(Icons.favorite_border),
                        ),
                        title: Text(store.regions[index].regionName),
                        subtitle: Text(
                          store.regions[index].postalCode,
                        ),
                      );
                    },
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
