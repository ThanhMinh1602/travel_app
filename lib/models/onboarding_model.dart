import 'package:travel_app/gen/assets.gen.dart';

class OnboardingModel {
  String? imageAsset;
  String? title;
  OnboardingModel();
}

List<OnboardingModel> onboardingData = [
  OnboardingModel()
    ..imageAsset = Assets.images.onboarding1.path
    ..title = 'Explore your interests',
  OnboardingModel()
    ..imageAsset = Assets.images.onboarding2.path
    ..title = 'Find your Travel Mate',
  OnboardingModel()
    ..imageAsset = Assets.images.onboarding3.path
    ..title = 'Plan your Trip',
];
