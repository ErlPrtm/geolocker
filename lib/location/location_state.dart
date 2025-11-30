abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationTracking extends LocationState {}

class LocationError extends LocationState {
  final String message;
  LocationError(this.message);
}