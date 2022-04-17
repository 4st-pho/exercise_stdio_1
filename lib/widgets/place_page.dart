import 'package:exercise_stdio_1/providers/restaurants.dart';
import 'package:exercise_stdio_1/widgets/place_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacePage extends StatelessWidget {
  const PlacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _restaurants = Provider.of<Restaurants>(context, listen: false);
    return ListView.builder(
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: _restaurants.itemRestaurant[index],
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: PlaceItem(),
        ),
      ),
      itemCount: _restaurants.itemRestaurant.length,
    );
  }
}
