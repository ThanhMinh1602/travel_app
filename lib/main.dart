import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:travel_app/firebase_options.dart';
import 'package:travel_app/screens/auth/bloc/auth_bloc.dart';
import 'package:travel_app/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:travel_app/screens/splash/bloc/splash_bloc.dart';
import 'package:travel_app/screens/splash/splash_screen.dart';
import 'package:travel_app/screens/user_infomation.dart/bloc/user_infomation_bloc.dart';
import 'package:travel_app/service/local/share_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.initialise();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => SplashBloc()),
        BlocProvider(create: (context) => UserInfomationBloc())
      ],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: AppColor.primaryColor,
            focusColor: AppColor.primaryColor,
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
