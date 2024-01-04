import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:travel_app/models/onboarding_model.dart';

class DotPage extends StatelessWidget {
  const DotPage({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: onboardingData.length,
      axisDirection: Axis.horizontal,
      effect: CustomizableEffect(
        activeColorOverride: (index) => AppColor.primaryColor,
        inActiveColorOverride: (index) => Colors.transparent,
        spacing: 33.0,
        dotDecoration: DotDecoration(
          width: 9.0,
          height: 9.0,
          dotBorder: const DotBorder(color: AppColor.primaryColor, width: 1),
          rotationAngle: 45.0,
          borderRadius: BorderRadius.circular(2.0),
          color: Colors.white.withOpacity(0.25),
        ),
        activeDotDecoration: DotDecoration(
          width: 9.0,
          height: 9.0,
          borderRadius: BorderRadius.circular(2.0),
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
