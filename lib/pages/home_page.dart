import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/home_bloc.dart';
import 'package:stdio_week_6/models/hotel.dart';
import 'package:stdio_week_6/pages/widgets/hotel_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeBloc = Homebloc();
  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    _homeBloc.init();
    return StreamBuilder<List<Hotel>>(
      stream: _homeBloc.listHotelStream,
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return const SizedBox();
        }
        List<Hotel> hotels = snapshot.data!;
        return ListView.builder(
          itemCount: hotels.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: HotelCard(hotel: hotels[index]),
            );
          },
        );
      }
    );
  }
}
