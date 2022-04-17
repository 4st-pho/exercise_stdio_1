import 'package:exercise_stdio_1/models/restaurant.dart';
import 'package:exercise_stdio_1/providers/restaurants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/place_detail_screen.dart';

class FavoriteItem extends StatefulWidget {
  const FavoriteItem({Key? key}) : super(key: key);

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {
    final _restaurant = Provider.of<Restaurant>(context, listen: false);
    final _restaurants = Provider.of<Restaurants>(context);
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) {
          _restaurants.toggleFavorite(_restaurant.id);
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 30),
        color: Colors.orange,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      child: Card(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => PlaceDetailScreen(
                      id: _restaurant.id,
                    ),
                  ),
                );
              },
              title: Text(_restaurant.name),
              subtitle: Text(_restaurant.address),
            ),
          ],
        ),
      ),
    );
  }
}
