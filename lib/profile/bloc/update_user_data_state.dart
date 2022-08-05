part of 'update_user_data_cubit.dart';

abstract class UpdateUserDataState extends Equatable {
  const UpdateUserDataState();
}

class UpdateUserDataInitial extends UpdateUserDataState {
  @override
  List<Object> get props => [];
}

class UpdateUserDataLoading extends UpdateUserDataState {
  @override
  List<Object> get props => [];
}

class UpdateUserDataSuccess extends UpdateUserDataState {
  final User user;
  const UpdateUserDataSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class UpdateUserDataFailure extends UpdateUserDataState {
  final String error;
  const UpdateUserDataFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class FetchCurrentUserDataSuccess extends UpdateUserDataState {
  final TextEditingController? name, email, password;

  const FetchCurrentUserDataSuccess({this.name, this.email, this.password});

  @override
  List<Object?> get props => [name, email];
}
