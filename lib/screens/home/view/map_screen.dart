import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_tmap/screens/home/controller/track_controller.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  TrackController trackController = Get.put(
    TrackController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Location tracker"),
        centerTitle: true,
        backgroundColor: Colors.purple.shade400,
      ),
      body: Stack(
        children: [
          GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      trackController.lat.value, trackController.lon.value),
              ),
            markers: {
                Marker(draggable: true,markerId: MarkerId("Prina"),position: LatLng(trackController.lat.value,trackController.lon.value))
            },
          )
        ],
      ),
    ));
  }
}
