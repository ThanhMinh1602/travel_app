import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(authLogin);
  }

  Future<void> authLogin(event, emit) async {
    if (event is SignupEvent) {
      emit(SingupLoading());
      try {
        await _auth.createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(SignupSuccess());
      } catch (e) {
        emit(SignupFailureState(errorMessage: e.toString()));
      }
    }
  }
}
