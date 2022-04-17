import 'package:exercise_stdio_1/providers/restaurants.dart';
import 'package:exercise_stdio_1/utils/colors.dart';
import 'package:exercise_stdio_1/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _restaurants = Provider.of<Restaurants>(context, listen: false);
    return _restaurants.favoriteRestaurant.isEmpty
        ? const Center(
            child: Text(
              'Empty',
              style: TextStyle(color: MyColor.textLight, fontSize: 25),
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: _restaurants.favoriteRestaurant[index],
              child: const FavoriteItem(),
            ),
            itemCount: _restaurants.favoriteRestaurant.length,
          );
  }
}
