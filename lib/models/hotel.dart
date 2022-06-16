import 'package:stdio_week_6/models/review.dart';
import 'package:stdio_week_6/models/location.dart';

import 'dart:convert';

Hotel hotelFromJson(String str) => Hotel.fromJson(json.decode(str));

String hotelToJson(Hotel data) => json.encode(data.toJson());

class Hotel {
  Hotel({
    required this.id,
    required this.name,
    required this.address,
    required this.location,
    required this.description,
    required this.rating,
    required this.reviews,
    required this.imagePath,
  });

  final String id;
  String name;
  Location location;
  String address;
  String description;
  String imagePath;
  double rating;
  List<Review> reviews;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        location: json["location"],
        description: json["description"],
        rating: json["rating"].toDouble(),
        reviews:
            List<Review>.from(json["reviews"].map((e) => reviewFromJson(e))),
        imagePath: json["imagePath"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "location": location,
        "description": description,
        "rating": rating,
        "reviews": List<dynamic>.from(reviews.map((e) => reviewToJson(e))),
        "imagePath": imagePath,
      };
}

List<Hotel> hotels = [
  Hotel(
      id: 'h1',
      name: 'Noma',
      address: 'Copenhagen, Denmark  Denmark asasas Denma rkas as asas',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      rating: 5.0,
      imagePath:
          'https://q-xx.bstatic.com/xdata/images/hotel/840x460/251503676.jpg?k=39fa968d9a1c2d5dcdae81d9afe9dd523cdf5166718822c2f1187a06f658c9c6&o=',
      reviews: [
        review1,
        review2,
        review3,
        review2,
        review2,
        review2,
        review2,
        review2,
        review2,
        review2
      ],
      location: Location(
        latitude: 16.46293594509449,
        longitude: 107.58844216217109,
      )),
  Hotel(
      id: 'h2',
      name: 'Asador Etxebarri',
      address: 'Atxondo, Spain',
      location: Location(
        latitude: 16.46293594509449,
        longitude: 107.58844216217109,
      ),
      description:
          'The ultimate in artisanal cookery from the Basque king of the barbecue ',
      rating: 4.5,
      reviews: [review1, review3, review2],
      imagePath:
          'https://media-cdn.tripadvisor.com/media/photo-s/1a/27/1e/11/halepuna-waikiki-by-halekulani.jpg'),
  Hotel(
      id: 'h3',
      name: 'Frantzén',
      address: 'Stockholm, Sweden, Denmark',
      location: Location(
        latitude: 16.46293594509449,
        longitude: 107.58844216217109,
      ),
      description:
          'The Swedish capital’s most famous culinary son invites you to an Asian-tinged house party',
      rating: 3.0,
      reviews: [review1, review4, review3],
      imagePath:
          'https://www.theworlds50best.com/filestore/jpg/W50BR2021-150-Frantzen-1.jpg'),
  Hotel(
      id: 'h4',
      name: 'Pujol',
      address: 'Mexico City, Mexico',
      location: Location(
        latitude: 16.46293594509449,
        longitude: 107.58844216217109,
      ),
      description: 'The spirit of Mexico captured on a plate',
      rating: 2.5,
      reviews: [review1, review3],
      imagePath:
          'https://www.theworlds50best.com/filestore/jpg/W50BR2021-150-Pujol-1.jpg'),
];
