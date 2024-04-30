import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final Restaurant restaurants;
  const DetailPage({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
              tag: restaurants.pictureId,
              child: Image.network(restaurants.pictureId))
        ],
      ),
    );
  }
}
