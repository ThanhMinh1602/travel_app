import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/service/local/share_pref.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<MoveToLoginScreen>(checkIsLogin);
  }

  Future<void> checkIsLogin(event, emit) async {
    emit(SplashInitial());
    if (event is MoveToLoginScreen) {
      if (SharedPrefs.token != null) {
        await Future.delayed(
          const Duration(seconds: 2),
          () {
            emit(Logged());
          },
        );
      } else {
        await Future.delayed(
          const Duration(seconds: 2),
          () {
            emit(NotLogged());
          },
        );
      }
    }
  }
}
