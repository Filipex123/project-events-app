import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleSimpleMap extends StatefulWidget {
  @override
  State<GoogleSimpleMap> createState() => GoogleSimpleMapState();
}

class GoogleSimpleMapState extends State<GoogleSimpleMap> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    // Brasília cordinates
    target: LatLng(-15.793699, -47.882720),
    zoom: 11,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      mapType: MapType.normal,
      zoomControlsEnabled: false,
      compassEnabled: false,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      onTap: (latlong) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    ));
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
