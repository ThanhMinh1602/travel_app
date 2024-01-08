import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthBloc() : super(AuthInitialState()) {
    on<AuthEvent>(authLogin);
  }

  Future<void> authLogin(event, emit) async {
    if (event is SignupEvent) {
      emit(AuthLoadingState());
      try {
        await _auth.createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(AuthSuccessState());
      } catch (e) {
        emit(AuthFailureState(errorMessage: e.toString()));
      }
      if (event is LoginEvent) {
        emit(AuthLoadingState());
        try {
          await _auth.signInWithEmailAndPassword(
              email: event.email, password: event.password);
          emit(AuthSuccessState());
        } catch (e) {
          emit(AuthFailureState(errorMessage: e.toString()));
        }
      }
    }
  }
}
