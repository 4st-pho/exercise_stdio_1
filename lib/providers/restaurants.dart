import 'package:exercise_stdio_1/models/restaurant.dart';
import 'package:flutter/foundation.dart';

class Restaurants with ChangeNotifier {
  final List<Restaurant> _item = [
    Restaurant(
        id: 'r1',
        name: 'Nhà hàng Không Gian Xưa',
        title: 'Giản dị,mốc mạc mà đậm đà',
        address: '205 Điện Biên Phủ, TP. Huế',
        imageUrl: [
          'https://images.foody.vn/res/g1/880/s800/foody-khong-gian-xua-186-636605152555572336.jpg',
          'https://scontent.fdad3-4.fna.fbcdn.net/v/t39.30808-6/217599353_393731809083654_893673035342706045_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=e3f864&_nc_ohc=xrqYNCq4JAYAX-7I-jP&_nc_ht=scontent.fdad3-4.fna&oh=00_AT9TIF9PXuCNoqouew2chjjUIyWFu6mqdRccbyzyZ2_pRg&oe=625FD716',
          'https://media-cdn.tripadvisor.com/media/photo-s/04/a0/d1/ec/khong-gian-xua.jpg'
        ]),
    Restaurant(
        id: 'r2',
        name: 'Nhà hàng Huế Cổ',
        title: 'Ancient Huế Garden Houses',
        address: '104/47 Kim Long, TP. Huế',
        imageUrl: [
          'https://dulichkhampha24.com/wp-content/uploads/2021/04/nha-hang-hue-3.jpg',
          'https://khamphadisan.com.vn/wp-content/uploads/2016/10/Download-1.jpg',
          'https://dulichkhampha24.com/wp-content/uploads/2021/04/nha-hang-hue-3.jpg'
        ]),
    Restaurant(
        id: 'r3',
        name: 'Nhà hàng Khải Hoàn',
        title: 'Phong cách truyền thống, sang trọng',
        address: '90 – 94 Lê Lợi, TP.Huế',
        imageUrl: [
          'https://dulichkhampha24.com/wp-content/uploads/2021/04/nha-hang-hue-4.jpg',
          'https://media.foody.vn/res/g1/269/prof/s/foody-mobile-hoan-jpg-144-636135979174481170.jpg'
        ]),
    Restaurant(
        id: 'r4',
        name: 'Nhà hàng sân vườn Y Thảo',
        title:
            'Mang lối kiến trúc cổ, yên tĩnh, lịch sự theo hơi hướng cổ điển',
        address: 'Số 3 Thạch Hân, TP.Huế',
        imageUrl: [
          'https://dulichkhampha24.com/wp-content/uploads/2021/04/nha-hang-hue-6.jpg',
          'http://khamphahue.com.vn/Portals/0/DuLich/NhaHang/YThao/Khamphahue_YThaoGarden-Hue-VietNam_DulichHue.jpg'
        ]),
  ];
  List<Restaurant> get itemRestaurant => [..._item];
  List<Restaurant> get favoriteRestaurant =>
      [..._item.where((element) => element.favorite)];
  Restaurant findById(String id) {
    return _item.firstWhere((element) => element.id == id);
  }

  void toggleFavorite(String id) {
    final index = _item.indexWhere((element) => element.id == id);
    _item[index].favorite = !_item[index].favorite;
    notifyListeners();
  }
}
