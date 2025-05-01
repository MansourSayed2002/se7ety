import 'dart:async';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/message_bar.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

class GoPlaceMapScreen extends StatefulWidget {
  const GoPlaceMapScreen({super.key, required this.latLngdoc});
  final LatLng latLngdoc;
  @override
  State<GoPlaceMapScreen> createState() => _GoPlaceMapScreenState();
}

class _GoPlaceMapScreenState extends State<GoPlaceMapScreen> {
  MapController? mapController;
  late StreamSubscription<Position> positionStream;
  LatLng? latlng;
  @override
  void didChangeDependencies() async {
    mapController = MapController();
    await determinePosition();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    mapController!.dispose();
    positionStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          TextApp.goToDoctor,
          style: getBodyStyle(
            color: ColorApp.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body:
          latlng != null && widget.latLngdoc != LatLng(0.0, 0.0)
              ? FlutterMap(
                mapController: mapController,
                options: MapOptions(initialZoom: 10.0, initialCenter: latlng!),
                children: [
                  TileLayer(
                    urlTemplate: dotenv.env['URL_TEMPLATE'].toString(),
                    userAgentPackageName:
                        dotenv.env['USER_AGENT_PACKAGE_NAME'].toString(),
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 45.0,
                        height: 45.0,
                        point: latlng!,
                        child: Icon(
                          Icons.location_on,
                          color: ColorApp.red,
                          size: 35.0,
                        ),
                      ),
                      Marker(
                        width: 45.0,
                        height: 45.0,
                        point: widget.latLngdoc,
                        child: Icon(
                          Icons.location_pin,
                          color: ColorApp.primery,
                          size: 35.0,
                        ),
                      ),
                    ],
                  ),
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: [latlng!, widget.latLngdoc],
                        strokeWidth: 5.0,
                        color: ColorApp.second,
                      ),
                    ],
                  ),
                ],
              )
              : widget.latLngdoc == LatLng(0.0, 0.0)
              ? Center(
                child: Text(TextApp.doNotLocation, style: getBodyStyle()),
              )
              : Center(child: CircularProgressIndicator()),
    );
  }

  determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      positionStream = Geolocator.getPositionStream().listen((position) {
        latlng = LatLng(position.latitude, position.longitude);
        if (latlng == widget.latLngdoc) {
          doneLoc();
        }
        log(position.latitude.toString());
        log(position.longitude.toString());
        setState(() {});
      });
    }
  }

  doneLoc() {
    context.messageBar(TextApp.doneLoc, Colors.green);
    context.pop();
  }
}
