import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/components/button/app_button.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:travel_app/constants/app_style.dart';
import 'package:travel_app/gen/assets.gen.dart';
import 'package:travel_app/screens/auth/auth_screen.dart';
import 'package:travel_app/screens/auth/bloc/auth_bloc.dart';
import 'package:travel_app/screens/auth/widgets/app_text_field.dart';
import 'package:travel_app/utils/validator.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    final bloc = AuthBloc();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                Assets.icons.logApp.path,
                width: 78.w,
              ),
            ),
            SizedBox(width: 10.w),
            Hero(
              tag: 'title',
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Trave',
                  style: GoogleFonts.poppins(
                    color: AppColor.white,
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'ally',
                  style: GoogleFonts.poppins(
                    color: AppColor.primaryColor,
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ])),
            ),
          ],
        ),
        SizedBox(height: 66.0.h),
        Expanded(
          child: Hero(
            tag: 'form',
            child: Material(
              color: Colors.transparent,
              child: Form(
                key: formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 71.0.w,
                  ).copyWith(
                    top: 28.0,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColor.loginFormColor.withOpacity(0.75),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(55.0.r))),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Text(
                        'Welcome',
                        style: AppStyle.titleLogin,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24.0.h),
                      AppTextField(
                          controller: emailController,
                          text1: 'Email',
                          validator: (value) => Validator.checkEmail(value)),
                      SizedBox(height: 25.0.h),
                      AppTextField(
                          controller: passwordController,
                          text1: 'Password',
                          obscureText: true,
                          validator: (value) => Validator.checkPassword(value)),
                      SizedBox(height: 25.0.h),
                      AppTextField(
                        controller: confirmPasswordController,
                        text1: 'Confirm Password',
                        obscureText: true,
                        validator: (value) => Validator.confirmPassword(
                            value, passwordController.text),
                      ),
                      SizedBox(height: 55.0.h),
                      Center(
                        child: AppButton(
                          text: 'Sign Up',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              bloc.add(
                                SignupEvent(
                                  email: emailController.text.trim(),
                                  password:
                                      confirmPasswordController.text.trim(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 30.0.h),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Already have an account? ',
                                style: AppStyle.regular14),
                            TextSpan(
                              text: 'Login',
                              style: AppStyle.regular14.copyWith(
                                  color: AppColor.primaryColor,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w800),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const AuthScreen(isLogin: false),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}