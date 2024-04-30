import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/home_page.dart';
import 'package:restaurant_app/restaurant_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        DetailPage.routeName: (context) => DetailPage(
            restaurants:
                ModalRoute.of(context)?.settings.arguments as Restaurant)
      },
    );
  }
}
