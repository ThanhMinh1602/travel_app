import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvents, OnboardingStates> {
  OnboardingBloc() : super(const OnboardingStates()) {
    on<OnboardingEvents>(pageIndex);
  }

  Future<void> pageIndex(event, emit) async {
    final updatedPageIndex = event.pageIndex;
    emit(OnboardingStates(pageIndex: updatedPageIndex));
  }
}
