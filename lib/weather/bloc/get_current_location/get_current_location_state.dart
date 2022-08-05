part of 'get_current_location_cubit.dart';

abstract class GetCurrentLocationState extends Equatable {
  const GetCurrentLocationState();
}

class GetCurrentLocationInitial extends GetCurrentLocationState {
  @override
  List<Object> get props => [];
}

class GetCurrentLocationSuccess extends GetCurrentLocationState {
  final double? latitude;
  final double? longitude;
  const GetCurrentLocationSuccess({this.latitude, this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}

class GetCurrentLocationFailure extends GetCurrentLocationState {
  final String? error;
  const GetCurrentLocationFailure({this.error});

  @override
  List<Object?> get props => [error];
}
