import 'package:deligo/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMapScaffold extends StatelessWidget {
  const CustomMapScaffold({
    super.key,
    this.bottomChild,
    this.bottomSheetBuilder,
    this.bottomSheetInitialSize,
  });

  final Widget? bottomChild;
  final ScrollableWidgetBuilder? bottomSheetBuilder;
  final double? bottomSheetInitialSize;

  @override
  Widget build(BuildContext context) {
    const position = LatLng(37.42796133580664, -122.085749655962);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FutureBuilder<BitmapDescriptor>(
            future:
                BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, Assets.pinsIcLocation),
            builder: (context, snapshot) {
              return GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: position,
                  zoom: 16.0,
                ),
                mapType: MapType.normal,
                myLocationEnabled: false,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) async {},
                markers: {
                  if (snapshot.hasData)
                    Marker(
                      markerId: const MarkerId("location"),
                      position: position,
                      icon: snapshot.data as BitmapDescriptor,
                    ),
                },
              );
            },
          ),
          const Positioned(
            top: 52,
            child: BackButton(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).scaffoldBackgroundColor,
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
      bottomSheet: bottomSheetBuilder != null
          ? DraggableScrollableSheet(
              expand: false,
              initialChildSize: bottomSheetInitialSize ?? 0.08,
              minChildSize: bottomSheetInitialSize ?? 0.08,
              maxChildSize: 0.8,
              snap: true,
              builder: bottomSheetBuilder!,
            )
          : null,
    );
  }
}
