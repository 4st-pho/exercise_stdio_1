import 'package:stdio_week_6/models/comment.dart';
import 'package:stdio_week_6/models/location.dart';

class Hotel {
  Hotel({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.rating,
    required this.location,
    required this.imagePath,
    required this.comments,
    this.isSave = false,
  });
  final String id;
  String name;
  Location location;
  String address;
  String description;
  bool isSave;
  String imagePath;
  double rating;
  List<Comment> comments;
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
      comments: [comment1, comment2, comment3],
      location: const Location(
        x: 16.46293594509449,
        y: 107.58844216217109,
      ),
      isSave: true),
  Hotel(
      id: 'h2',
      name: 'Asador Etxebarri',
      address: 'Atxondo, Spain',
      location: const Location(
        x: 16.46293594509449,
        y: 107.58844216217109,
      ),
      description:
          'The ultimate in artisanal cookery from the Basque king of the barbecue ',
      rating: 4.5,
      comments: [comment1, comment3, comment2],
      imagePath:
          'https://media-cdn.tripadvisor.com/media/photo-s/1a/27/1e/11/halepuna-waikiki-by-halekulani.jpg'),
  Hotel(
      id: 'h3',
      name: 'Frantzén',
      address: 'Stockholm, Sweden, Denmark',
      location: const Location(
        x: 16.46293594509449,
        y: 107.58844216217109,
      ),
      description:
          'The Swedish capital’s most famous culinary son invites you to an Asian-tinged house party',
      rating: 3.0,
      comments: [comment1, comment4, comment3],
      imagePath:
          'https://www.theworlds50best.com/filestore/jpg/W50BR2021-150-Frantzen-1.jpg'),
  Hotel(
      id: 'h4',
      name: 'Pujol',
      address: 'Mexico City, Mexico',
      location: const Location(
        x: 16.46293594509449,
        y: 107.58844216217109,
      ),
      description: 'The spirit of Mexico captured on a plate',
      rating: 2.5,
      comments: [comment1, comment3],
      imagePath:
          'https://www.theworlds50best.com/filestore/jpg/W50BR2021-150-Pujol-1.jpg'),
];
