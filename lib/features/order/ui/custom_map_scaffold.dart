import 'package:deligo/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMapScaffold extends StatelessWidget {
 const CustomMapScaffold({super.key, this.bottomChild});

 final Widget? bottomChild;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: const CameraPosition(
                target: LatLng(37.42796133580664, -122.085749655962), zoom: 16.0),
            mapType: MapType.normal,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) async {},
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 36.0),
              child: Image.asset(
                Assets.pinsIcLocation,
                height: 40,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.keyboard_arrow_left),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.gps_fixed),
                      ),
                    ),
                  ],
                ),
                bottomChild ?? const SizedBox.shrink(),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
