part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpLoading extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpSuccess extends SignUpState {
  final User user;
  const SignUpSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class SignUpFailure extends SignUpState {
  final String error;
  const SignUpFailure({required this.error});

  @override
  List<Object> get props => [error];
}
