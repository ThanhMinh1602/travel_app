part of 'splash_bloc.dart';

@immutable
abstract class SplashState extends Equatable {
  @override
  List<Object?> get props => [];
  const SplashState();
}

class SplashInitial extends SplashState {} //trạng thái bắt đầu

class Logged extends SplashState {} 
class NotLogged extends SplashState {} 