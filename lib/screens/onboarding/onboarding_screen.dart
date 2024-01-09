import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:travel_app/gen/assets.gen.dart';
import 'package:travel_app/models/onboarding_model.dart';
import 'package:travel_app/screens/auth/main_login_screen.dart';
import 'package:travel_app/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:travel_app/screens/onboarding/widgets/onboarding_dot.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);

  OnboardingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OnboardingBloc>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 31, 30, 1),
      body: BlocBuilder<OnboardingBloc, OnboardingStates>(
        builder: (context, state) {
          return Stack(
            children: [
              PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  bloc.add(OnboardingEvents(pageIndex: value));
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  final data = onboardingData[index];
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            data.imageAsset.toString(),
                            height: 839.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned.fill(
                            top: 300.h,
                            child: Container(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                    AppColor.black,
                                    Colors.transparent,
                                  ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter)),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          color: AppColor.black,
                        ),
                      )
                    ],
                  );
                },
              ),
              Positioned(
                right: 37.w,
                top: 694.0.h,
                child: _onboardButton(state, context),
              ),
              Positioned(
                bottom: 151.65.h,
                right: 191.12.w,
                left: 45.31.w,
                child: Text(
                  onboardingData[state.pageIndex].title.toString(),
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 111.0.h,
                child: Center(
                  child: DotPage(controller: controller),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _onboardButton(OnboardingStates state, BuildContext context) {
    return GestureDetector(
      onTap: () {
        state.pageIndex == 2
            ? Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MainLoginScreen(),
                ),
              )
            : controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
      },
      child: Container(
        height: 79.w,
        width: 79.w,
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
            boxShadow: [
              const BoxShadow(blurRadius: 6.0),
              BoxShadow(
                blurRadius: 4.0,
                spreadRadius: 0.0,
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, -3),
              ),
              BoxShadow(
                  blurRadius: 4.0,
                  spreadRadius: 0.0,
                  color: Colors.white.withOpacity(0.25),
                  offset: const Offset(0, 0))
            ],
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 21.47),
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Image.asset(state.pageIndex == 2
              ? Assets.icons.doneIcon.path
              : Assets.icons.nextIcon.path),
        ),
      ),
    );
  }
}
