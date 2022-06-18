import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stdio_week_6/constants/collection_path.dart';
import 'package:stdio_week_6/models/hotel.dart';
import 'package:stdio_week_6/models/location.dart';
import 'package:stdio_week_6/models/review.dart';
import 'package:stdio_week_6/services/firebase_storage/storage_methods.dart';

class HotelFirestore {
  final _firestore = FirebaseFirestore.instance;
  // create hotel
  Future<void> createHotel({
    required String name,
    required String address,
    required String description,
    required File? file,
    required String collectionImagePath,
  }) async {
    final docHotel = _firestore.collection(CollectionPath.hotels).doc();
    final imagePath = file == null
        ? "https://lh3.googleusercontent.com/YwEI3NaAi6zzMMUBcM0wVJoggDYZwY2w-Y8lhyJFvnYD80mI6ubkY8C59BoWPmbubd4=w512"
        : await StorageMethos()
            .uploadAndGetImageLink(collectionImagePath, file);
    final hotel = Hotel(
        id: docHotel.id,
        name: name,
        address: address,
        location: Location(
          latitude: 16.46293594509449,
          longitude: 107.58844216217109,
        ),
        description: description,
        rating: 5,
        reviews: [],
        imagePath: imagePath);
    await docHotel.set(hotel.toJson());
  }

  //get curent user in cloud firestore

  Stream<List<Hotel>> get getHotels {
    return _firestore.collection(CollectionPath.hotels).snapshots().map(
        (snapshot) =>
            snapshot.docs.map((e) => Hotel.fromJson(e.data())).toList());
  }

  void addReviews({required String hotelId}) async {
    final docHotel = _firestore.collection(CollectionPath.hotels).doc(hotelId);
    await docHotel.update({
      "reviews": [
        review1.toJson(),
        review2.toJson(),
        review3.toJson(),
        review4.toJson(),
        review5.toJson()
      ]
    });
  }
}
