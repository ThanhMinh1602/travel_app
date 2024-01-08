part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignupEvent extends AuthEvent {
  final String email;
  final String password;

  const SignupEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SigupFailureEvent extends AuthEvent {
  final String errorMessage;

  const SigupFailureEvent({required this.errorMessage});
  @override
  // TODO: implement props
  List<Object> get props => [errorMessage];
}
