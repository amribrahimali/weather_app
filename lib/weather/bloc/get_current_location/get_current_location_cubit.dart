import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

part 'get_current_location_state.dart';

class GetCurrentLocationCubit extends Cubit<GetCurrentLocationState> {
  GetCurrentLocationCubit() : super(GetCurrentLocationInitial());

  Location location = Location();

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  Future<void> getCurrentLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    emit(GetCurrentLocationSuccess(
        latitude: _locationData?.latitude,
        longitude: _locationData?.longitude));
  }
}
