import 'dart:async';

import 'package:deligo/features/account/model/address.dart';
import 'package:deligo/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMapScaffold extends StatefulWidget {
  const CustomMapScaffold({
    super.key,
    this.bottomChild,
    this.bottomSheetBuilder,
    this.bottomSheetInitialSize,
    this.pin,
    this.showBackButton = false,
    this.showCenterPin = false,
    this.topChild,
    this.onAddressUpdate,
  });

  final Widget? bottomChild;
  final ScrollableWidgetBuilder? bottomSheetBuilder;
  final double? bottomSheetInitialSize;
  final String? pin;
  final bool showBackButton;
  final bool showCenterPin;
  final Widget? topChild;
  final Function(AddressDomain)? onAddressUpdate;

  @override
  State<CustomMapScaffold> createState() => _CustomMapScaffoldState();
}

class _CustomMapScaffoldState extends State<CustomMapScaffold> {
  final Completer<GoogleMapController> _controller = Completer();

  var position = const LatLng(37.42796133580664, -122.085749655962);
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FutureBuilder<BitmapDescriptor>(
            future: BitmapDescriptor.fromAssetImage(
              ImageConfiguration.empty,
              widget.pin ?? Assets.pinsIcLocation,
            ),
            builder: (context, snapshot) {
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: position,
                  zoom: 16.0,
                ),
                mapType: MapType.normal,
                myLocationEnabled: false,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onCameraMoveStarted: () {},
                onCameraMove: (CameraPosition cameraPosition) async {
                  if (widget.showCenterPin) {
                    widget.onAddressUpdate?.call(
                      AddressDomain(Icons.location_on, "Loading...", "Loading..."),
                    );
                    _debouncer.run(() async {
                      position = cameraPosition.target;
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(position.latitude, position.longitude);
                      AddressDomain address = AddressDomain(
                        Icons.location_on,
                        placemarks.firstOrNull?.name ?? "Loading...",
                        placemarks.firstOrNull?.street ?? "Loading...",
                      );
                      widget.onAddressUpdate?.call(address);
                    });
                  }
                },
                markers: {
                  if (snapshot.hasData && !widget.showCenterPin)
                    Marker(
                      markerId: const MarkerId("location"),
                      position: position,
                      icon: snapshot.data as BitmapDescriptor,
                    ),
                },
              );
            },
          ),
          if (widget.showCenterPin)
            Center(
              child: Image.asset(
                widget.pin ?? Assets.pinsIcLocation,
                scale: 2,
              ),
            ),
          if (widget.showBackButton)
            const Positioned(
              top: 52,
              child: BackButton(),
            ),
          Positioned(
            top: 52,
            child: widget.topChild ?? const SizedBox.shrink(),
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
                widget.bottomChild ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: widget.bottomSheetBuilder != null
          ? DraggableScrollableSheet(
              expand: false,
              initialChildSize: widget.bottomSheetInitialSize ?? 0.08,
              minChildSize: widget.bottomSheetInitialSize ?? 0.08,
              maxChildSize: 0.8,
              snap: true,
              builder: widget.bottomSheetBuilder!,
            )
          : null,
    );
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
