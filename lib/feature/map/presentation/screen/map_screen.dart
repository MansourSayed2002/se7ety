import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:se7ety/core/constants/enum/status_request.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/feature/auth/data/repo/auth_repo.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OpenStreetMapSearchAndPick(
        buttonColor: Colors.blue,
        buttonText: TextApp.setCurrentLocation,
        onPicked: (pickedData) async {
          var result = await AuthRepo.upLoadLocation(
            pickedData.latLong.latitude,
            pickedData.latLong.longitude,
          );
          if (result == StatusRequest.success) {
            context.pop();
          } else {
            log("There are wrong when upload latitude and longitude");
          }
        },
      ),
    );
  }
}
