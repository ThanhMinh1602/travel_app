import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/service/local/share_pref.dart';

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
        final userCredential = await _auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        final token = userCredential.user!.uid;
        if (token.isNotEmpty) {
          SharedPrefs.token = token;
          emit(AuthSignInSuccessState());
        }
      } catch (e) {
        emit(AuthSignInFailureState(errorMessage: e.toString()));
      }
    }
  }
}
