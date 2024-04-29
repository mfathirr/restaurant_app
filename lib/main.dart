import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Restaurant'),
        ),
        body: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/local_restaurant.json'),
          builder: (context, snapshot) {
            final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
            return ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildRestaurantList(restaurants[index]);
              },
            );
          },
        ),
      ),
    );
  }

  ListTile _buildRestaurantList(Restaurant restaurants) {
    return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            restaurants.pictureId,
            fit: BoxFit.cover,
            width: 100,
          ),
        ),
        title: Text(restaurants.name),
        subtitle: Text(restaurants.city));
  }
}
