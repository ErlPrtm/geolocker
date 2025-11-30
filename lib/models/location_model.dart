class LocationModel {
  final DateTime date;
  final double latitude;
  final double longitude;
  final String address;

  LocationModel({
    required this.date,
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(),
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      date: DateTime.parse(map['date']),
      latitude: map['latitude'],
      longitude: map['longitude'],
      address: map['address'],
    );
  }
}