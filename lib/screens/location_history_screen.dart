import 'package:flutter/material.dart';
import '../repositories/location_repository.dart';
import '../models/location_model.dart';
// import 'package:intl/intl.dart';
import '../widgets/location_card.dart';

class LocationHistoryScreen extends StatelessWidget {
  final LocationRepository repository = LocationRepository();

  LocationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.map, color: Colors.blue, size: 40),
            SizedBox(width: 10),
            Text(
              'Location History',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<LocationModel>>(
        future: repository.getLocations(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No locations recorded.'));
          } else {
            final locations = snapshot.data!;
            locations.sort((a, b) => b.date.compareTo(a.date));

            return ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                  final location = locations[index];
              return LocationCard(location: location);
              },
            );
          }
        },
      ),
    );
  }
}