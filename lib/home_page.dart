import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/restaurant_detail_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              return _buildRestaurantList(restaurants[index], context);
            },
          );
        },
      ),
    );
  }

  ListTile _buildRestaurantList(Restaurant restaurants, BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName,
            arguments: restaurants);
      },
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Hero(
        tag: restaurants.pictureId,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            restaurants.pictureId,
            fit: BoxFit.cover,
            width: 100,
          ),
        ),
      ),
      title: Text(
        restaurants.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        restaurants.city,
        style: const TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }
}
