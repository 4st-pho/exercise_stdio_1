import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/models/location.dart';

class MapPage extends StatelessWidget {
  const MapPage({
    Key? key,
  }) : super(key: key);
  // final Location location;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Hotel Address',
          style: MyFont.blackHeading,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(
                22,
                88,
              ),
              zoom: 20)),
    );
  }
}
