import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMapScaffold extends StatelessWidget {
  const CustomMapScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
                target: LatLng(37.42796133580664, -122.085749655962), zoom: 16.0),
            mapType: MapType.normal,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) async {},
          ),
        ],
      ),
    );
  }
}
