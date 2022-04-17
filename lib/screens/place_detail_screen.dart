import 'package:exercise_stdio_1/providers/restaurants.dart';
import 'package:exercise_stdio_1/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  final String id;
  const PlaceDetailScreen({required this.id, Key? key}) : super(key: key);

  Widget _titleBox({required String title, required double height}) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.all(5),
      height: height,
      color: MyColor.darkGray,
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
              child: Text(
            title,
            style: const TextStyle( fontSize: 20),
          )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _restaurant =
        Provider.of<Restaurants>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(title: Text(_restaurant.name)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15),
                width: _size.width,
                height: 200,
                child: Image.network(
                  _restaurant.imageUrl[index],
                  fit: BoxFit.cover,
                ),
              ),
              itemCount: _restaurant.imageUrl.length,
            ),
          ),
          _titleBox(title: _restaurant.title, height: 150),
          _titleBox(title: 'Address: ${_restaurant.address}', height: 150),
        ],
      ),
      backgroundColor: MyColor.bg,
    );
  }
}
