import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:location_tmap/screens/home/view/map_screen.dart';
import 'screens/home/view/track_screen.dart';
void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(p0) => TrackScreen(),
        'track':(p0) => MapScreen(),
      },
    ),
  );
}