import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/gen/assets.gen.dart';
import 'package:travel_app/screens/auth/widgets/login_form.dart';
import 'package:travel_app/screens/auth/widgets/signup_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key, required this.isLogin});
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(Assets.images.backgroundLogin.path,
                  fit: BoxFit.cover),
            ),
            Positioned.fill(
              top: 86.0.h,
              child: isLogin ? const LoginForm() : const SignupForm(),
            ),
          ],
        ),
      ),
    );
  }
}
