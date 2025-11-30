import 'dart:async'; // Import the Timer class
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'repositories/location_repository.dart';
import 'screens/location_history_screen.dart';
import 'models/location_model.dart';
import 'package:geocoding/geocoding.dart'; // Import geocoding package


final logger = Logger(
  printer: PrettyPrinter(),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await trackLocation(); //Track location (Every opening the apps)
  runApp(const MyApp());
}

Future<void> trackLocation() async {
  try {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    
    if(permission == LocationPermission.denied) {
      logger.w('Location permission denied');
    } else if (permission == LocationPermission.deniedForever) {
      logger.e('Location permission permanently denied. Opening app settings...');
      await Geolocator.openAppSettings();
    } else {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      logger.i('Location: ${position.latitude}, ${position.longitude}');

      // Reverse geocoding to get address
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark place = placemarks[0];
      String address = '${place.street}, ${place.locality}, ${place.country}';
      logger.i('Address: $address');

      // Save the location to the database
      final repository = LocationRepository();
      final location = LocationModel(
        date: DateTime.now(),
        latitude: position.latitude,
        longitude: position.longitude,
        address: address,
      );
      await repository.saveLocation(location);
      logger.d("Location saved to database: $location");
    }
  } catch (e) {
    logger.e('Error fetching location: $e');
  }
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location History',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LocationHistoryScreen(),
    );
  }
}