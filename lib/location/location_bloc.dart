import 'package:flutter_bloc/flutter_bloc.dart';
import 'location_event.dart';
import 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<StartTracking>((event, emit) {
      emit(LocationTracking());
    });

    on<StopTracking>((event, emit) {
      emit(LocationInitial());
    });
  }
}