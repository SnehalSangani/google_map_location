import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class TrackController extends GetxController
{
  RxDouble lat = 0.0.obs;
  RxDouble lon = 0.0.obs;
  RxList<Placemark> placeList = <Placemark>[].obs;
}