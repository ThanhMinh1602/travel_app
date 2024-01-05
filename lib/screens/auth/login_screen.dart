import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/components/button/app_button.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:travel_app/constants/app_style.dart';
import 'package:travel_app/gen/assets.gen.dart';
import 'package:travel_app/screens/auth/widgets/form_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Đây là thuộc tính quan trọng
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(Assets.images.backgroundLogin.path,
                  fit: BoxFit.cover),
            ),
            Positioned.fill(
              top: 86.0.h,
              child: Column(
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
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 71.0.w,
                          ).copyWith(
                            top: 28.0,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColor.loginFormColor.withOpacity(0.75),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(55.0.r))),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Text(
                                'Login',
                                style: AppStyle.titleLogin,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 24.0.h),
                              const FormInput(
                                text1: 'Email',
                                text2: '*',
                              ),
                              SizedBox(height: 25.0.h),
                              const FormInput(
                                text1: 'Password',
                                text2: '*',
                                obscureText: true,
                              ),
                              SizedBox(height: 55.0.h),
                              Center(
                                child: AppButton(
                                  text: 'Login',
                                  onTap: () {},
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
                                      text: 'Sign up',
                                      style: AppStyle.regular14.copyWith(
                                          color: AppColor.primaryColor,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w800),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen(),
                                            )),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
