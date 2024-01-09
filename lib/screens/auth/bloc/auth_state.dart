part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthSignInInitialState extends AuthState {}

class AuthSignInSuccessState extends AuthState {}

class AuthSignInLoadingState extends AuthState {}

class AuthSignInFailureState extends AuthState {
  final String errorMessage;

  const AuthSignInFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class AuthSignUpInitialState extends AuthState {}

class AuthSignUpSuccessState extends AuthState {}

class AuthSignUpLoadingState extends AuthState {}

class AuthSignUpFailureState extends AuthState {
  final String errorMessage;

  const AuthSignUpFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
