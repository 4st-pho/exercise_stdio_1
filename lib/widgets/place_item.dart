import 'package:exercise_stdio_1/models/restaurant.dart';
import 'package:exercise_stdio_1/providers/restaurants.dart';
import 'package:exercise_stdio_1/screens/place_detail_screen.dart';
import 'package:exercise_stdio_1/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _restaurant = Provider.of<Restaurant>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          color: MyColor.darkGray),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => PlaceDetailScreen(
                    id: _restaurant.id,
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: Stack(children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    _restaurant.imageUrl[0],
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: Container(
                    color: Colors.black38,
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      _restaurant.name,
                      style: const TextStyle(color: MyColor.textLight, fontSize: 20),
                    ),
                  ),
                  bottom: 20,
                  right: 0,
                )
              ]),
            ),
          ),
          Row(
            children: [
              Consumer<Restaurants>(
                builder: (_, restaurants, c) => Center(
                  child: IconButton(
                    onPressed: () {
                      restaurants.toggleFavorite(_restaurant.id);
                    },
                    icon: _restaurant.favorite
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
