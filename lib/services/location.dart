import 'package:geolocator/geolocator.dart';

// void getLocation() async {
//   print("inside getLocation()");
//   LocationPermission permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.always ||
//       permission == LocationPermission.whileInUse) {
//     printLocation();
//   } else {
//     requestPermission();
//   }
// }
//
// requestPermission() async {
//   print("inside requestPermission()");
//   LocationPermission permission = await Geolocator.requestPermission();
//   if (permission == LocationPermission.always ||
//       permission == LocationPermission.whileInUse) {
//     printLocation();
//   } else {
//     requestPermission();
//   }
// }
//
// printLocation() async {
//   print('inside printLocation');
//   Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.low);
//   print('Everything');
//   print(position);
// }
class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      bool looping = true;
      LocationPermission permission = await Geolocator.requestPermission();
      permission = await Geolocator.checkPermission();
      print(permission);
      print("GetCurrentLocation");
      while (looping) {
        if (permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse) {
          looping = false;
        } else {
          permission = await Geolocator.requestPermission();


          print(permission);
        }
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      print(latitude);
      print(longitude);
    } catch (e) {
      print("fuck");
    }
  }
}
