import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:travel_app/gen/assets.gen.dart';
import 'package:travel_app/screens/auth/update_inf_user_screen.dart';
import 'package:travel_app/screens/onboarding/onboarding_screen.dart';
import 'package:travel_app/screens/splash/bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashBloc splashBloc = BlocProvider.of<SplashBloc>(context);
    splashBloc.add(MoveToLoginScreen());
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is NotLogged) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OnboardingScreen(),
          ));
        }
        if (state is Logged) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const UpdateInfUser()),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: SvgPicture.asset(
            Assets.icons.logoSvg,
            // ignore: deprecated_member_use
            color: AppColor.primaryColor,
            width: 120.w,
          ),
        ),
      ),
    );
  }
}
