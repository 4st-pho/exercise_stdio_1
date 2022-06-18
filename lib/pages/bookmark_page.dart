import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/bookmark_bloc.dart';
import 'package:stdio_week_6/models/hotel.dart';
import 'package:stdio_week_6/pages/widgets/hotel_card.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {

  final _bookmarkBloc = BookmarkBloc();

@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bookmarkBloc.init();
  }
  @override
  void dispose() {
    _bookmarkBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Hotel>>(
        stream: _bookmarkBloc.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final hotels = snapshot.data!;
          return ListView.builder(
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              return HotelCard(hotel: hotels[index]);
            },
          );
        });
  }
}
