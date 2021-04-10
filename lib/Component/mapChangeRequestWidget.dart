import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapChangeRequestWidget extends StatefulWidget {
  MapChangeRequestWidget(this.oldLat, this.oldLng, this.newLat, this.newLng);
  var oldLat, oldLng, newLat, newLng;

  @override
  _MapChangeRequestWidgetState createState() => _MapChangeRequestWidgetState();
}

class _MapChangeRequestWidgetState extends State<MapChangeRequestWidget> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition newLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition oldLocation = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    var isSimilar =
        oldLocation.target.latitude == newLocation.target.latitude &&
            oldLocation.target.longitude == newLocation.target.longitude;
    return Container(
        child: Column(
      children: [
        Text("Header"),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: isSimilar ? Colors.white : Colors.red,
              ),
              padding: EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 2.15,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: oldLocation,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 2.15,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: oldLocation,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ],
        )
      ],
    ));
  }
}
