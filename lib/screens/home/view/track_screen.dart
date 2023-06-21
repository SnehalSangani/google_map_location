

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location_tmap/screens/home/controller/track_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({Key? key}) : super(key: key);

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  TrackController trackController = Get.put(TrackController(),);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Location Tracker"),
          centerTitle: true,
          backgroundColor: Colors.purple.shade400,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () async {

                var status = await Permission.location;
                if(await status.isDenied)
                {
                  await Permission.location.request();
                }

              }, child: Text("Permission"),style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade300),),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () async {
                Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                trackController.lat.value = position.latitude;
                trackController.lon.value = position.longitude;
              }, child: Text("Location"),style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade400),),SizedBox(height: 20,),
              Container(
                height: 70,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.purple.shade50,
                  border: Border.all(width: 1, color: Colors.black),

              ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Obx(() =>  Text("${trackController.lat.value}")),
                      SizedBox(height: 10,),
                      Obx(() =>  Text("${trackController.lon.value}")),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: () async{
                List<Placemark> placemarkList = await placemarkFromCoordinates(trackController.lat.value, trackController.lon.value);
                trackController.placeList.value = placemarkList;
              }, child: Text("Track Me"),style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade300),),
              SizedBox(height: 30,),
              Obx(() => Text(trackController.placeList.isEmpty?" ":"${trackController.placeList[0]}",style: TextStyle(fontSize: 15),)),

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(backgroundColor: Colors.purple,
          onPressed: () {
            Get.toNamed('track');
          },child: Icon(Icons.location_pin),
        ),
      ),
    );
  }
}
