import 'package:flutter/material.dart';
import 'package:kiedy_smieci_app/screens/dates.dart';
import 'package:provider/provider.dart';
import './store/garbageStore.dart';
import './screens/home.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => GarbageStore()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiedy Śmieci',
      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (context) => Home(),
        DatesScreen.routeName: (context) => DatesScreen(),
      },
    );
  }
}
