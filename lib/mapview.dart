import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {

  final double lattitude;
  final double longitutde;

  const MapView({super.key, required this.lattitude, required this.longitutde});

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  double lattitude1 = 0;
  double longitude1 = 0;

  @override
  void initState() {
    lattitude1 = widget.lattitude;
    longitude1 = widget.longitutde;
    super.initState();
  }

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(lattitude1, longitude1),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}