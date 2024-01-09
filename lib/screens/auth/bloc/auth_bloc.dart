import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthBloc() : super(AuthSignInInitialState()) {
    on<AuthEvent>(authLogin);
  }

  Future<void> authLogin(event, emit) async {
    //signup with email and password
    if (event is SignupEvent) {
      emit(AuthSignUpLoadingState());
      try {
        await _auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(AuthSignUpSuccessState());
      } catch (e) {
        emit(AuthSignUpFailureState(errorMessage: e.toString()));
      }
      //login with email and password
    } else if (event is LoginEvent) {
      emit(AuthSignInLoadingState());
      try {
        await _auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(AuthSignInSuccessState());
      } catch (e) {
        emit(AuthSignInFailureState(errorMessage: e.toString()));
      }
    }
  }
}
