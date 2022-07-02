import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stdio_week_6/blocs/review_page_bloc.dart';
import 'package:stdio_week_6/blocs/select_rating_bloc.dart';
import 'package:stdio_week_6/models/review.dart';
import 'package:stdio_week_6/pages/add_review_page.dart';
import 'package:stdio_week_6/pages/offline_page.dart';
import 'package:stdio_week_6/pages/widgets/filter_review.dart';
import 'package:stdio_week_6/pages/widgets/review_page_bar.dart';
import 'package:stdio_week_6/widgets/choice_chip_rating.dart';

import '../services/network/network_service.dart';

class ReviewPage extends StatefulWidget {
  final String hotelName;
  final String hotelId;
  final List<Review> reviews;
  const ReviewPage(
      {Key? key,
      required this.reviews,
      required this.hotelName,
      required this.hotelId})
      : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final _selectRatingBloc = SelectRatingBloc();
  final _reviewPageBloc = ReviewPageBloc();

  @override
  void dispose() {
    super.dispose();
    _selectRatingBloc.dispose();
    _reviewPageBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _reviewPageBloc.init(widget.reviews);
    final networkStatus = context.watch<NetworkStatus>();
    return Scaffold(
      body: networkStatus == NetworkStatus.offline
          ? const OfflinePage()
          : SafeArea(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: ReviewPageBar(
                        hotelName: widget.hotelName,
                        ratedQuantity: widget.reviews.length,
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => AddReviewPage(
                                        hotelId: widget.hotelId,
                                        hotelName: widget.hotelName,
                                        ratedQuantity: widget.reviews.length,
                                      )))
                              .then((value) {
                            if (value != null) {
                              if (value == 'pop') {
                                Navigator.of(context).pop();
                              }
                            }
                          });
                        },
                      )),
                  StreamBuilder<double>(
                      stream: _selectRatingBloc.stream,
                      initialData: 10,
                      builder: (context, snapshot) {
                        final rating = snapshot.data!;
                        return SizedBox(
                          height: 80,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChoiceChip(
                                    label: Text('All',
                                        style: TextStyle(
                                            color: Colors.yellow.shade700)),
                                    selected: rating < 0 ? true : false,
                                    selectedColor: Colors.deepPurple,
                                    onSelected: (value) {
                                      _selectRatingBloc.chooseRating(-1);
                                      _reviewPageBloc.filterRatingByReview(-1);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChoiceChipRating(
                                    currentRating: rating,
                                    rating: 5,
                                    onSelected: (value) {
                                      _selectRatingBloc.chooseRating(5);
                                      _reviewPageBloc.filterRatingByReview(5);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChoiceChipRating(
                                    currentRating: rating,
                                    rating: 4,
                                    onSelected: (value) {
                                      _selectRatingBloc.chooseRating(4);
                                      _reviewPageBloc.filterRatingByReview(4);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChoiceChipRating(
                                    currentRating: rating,
                                    rating: 3,
                                    onSelected: (value) {
                                      _selectRatingBloc.chooseRating(3);
                                      _reviewPageBloc.filterRatingByReview(3);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChoiceChipRating(
                                    currentRating: rating,
                                    rating: 2,
                                    onSelected: (value) {
                                      _selectRatingBloc.chooseRating(2);
                                      _reviewPageBloc.filterRatingByReview(2);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChoiceChipRating(
                                    currentRating: rating,
                                    rating: 1,
                                    onSelected: (value) {
                                      _selectRatingBloc.chooseRating(1);
                                      _reviewPageBloc.filterRatingByReview(1);
                                    }),
                              ),
                            ],
                          ),
                        );
                      }),
                  Expanded(
                    child: StreamBuilder(
                      stream: _reviewPageBloc.stream,
                      initialData: widget.reviews,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        final data = snapshot.data!;
                        return FilterReview(
                          reviews: data,
                          hotelId: widget.hotelId,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
