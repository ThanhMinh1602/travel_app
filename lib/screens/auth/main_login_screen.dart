import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/components/button/app_button.dart';
import 'package:travel_app/components/button/other_button_login.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:travel_app/gen/assets.gen.dart';
import 'package:travel_app/screens/auth/auth_screen.dart';
class MainLoginScreen extends StatelessWidget {
  const MainLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.backgroundLogin.path,
                fit: BoxFit.cover),
          ),
          Positioned.fill(
            top: 51.h,
            child: Column(
              children: [
                Hero(
                  tag: 'logo',
                  child: SvgPicture.asset(
                      Assets.icons.logoSvg,
                      // ignore: deprecated_member_use
                      color: AppColor.white,
                      width: 172.w,
                    ),
                ),
                SizedBox(height: 15.h),
                Hero(
                  tag: 'title',
                  child: RichText(
                    text: TextSpan(
                      children: [
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
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 11.0.h),
                Expanded(
                  child: Hero(
                    tag: 'form',
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 43.0.w, vertical: 50.0.h),
                        decoration: BoxDecoration(
                            color: AppColor.loginFormColor.withOpacity(0.75),
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(55.0.r))),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                AppButton.outline(
                                  text: 'Sign Up',
                                  onTap: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        transitionDuration:
                                            const Duration(milliseconds: 800),
                                        pageBuilder: (BuildContext context,
                                            Animation<double> animation,
                                            Animation<double>
                                                secondaryAnimation) {
                                          return const AuthScreen(
                                              isLogin: false);
                                        },
                                      ),
                                    );
                                  },
                                ),
                                const Spacer(),
                                AppButton(
                                    text: 'Log In',
                                    onTap: () {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          transitionDuration:
                                              const Duration(milliseconds: 800),
                                          pageBuilder: (BuildContext context,
                                              Animation<double> animation,
                                              Animation<double>
                                                  secondaryAnimation) {
                                            return const AuthScreen(
                                              isLogin: true,
                                            );
                                          },
                                        ),
                                      );
                                    }),
                              ],
                            ),
                            SizedBox(height: 40.0.h),
                            Row(
                              children: [
                                const Expanded(
                                  child: Divider(
                                    endIndent: 16.0,
                                    indent: 16.0,
                                    color: AppColor.grey626262,
                                    thickness: 0.8,
                                  ),
                                ),
                                Text('OR',
                                    style: GoogleFonts.poppins(
                                        color: AppColor.grey626262,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w300)),
                                const Expanded(
                                  child: Divider(
                                    endIndent: 16.0,
                                    indent: 16.0,
                                    color: AppColor.grey626262,
                                    thickness: 0.8,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 47.0.h),
                            OtherButtonLogin(
                              icon: Assets.icons.ggIc,
                              text: 'Continue with Google',
                              onTap: () {},
                            ),
                            SizedBox(height: 32.0.h),
                            OtherButtonLogin(
                              icon: Assets.icons.fbIc,
                              text: 'Continue with Facebook',
                              onTap: () {},
                            ),
                            SizedBox(height: 32.0.h),
                            OtherButtonLogin(
                              icon: Assets.icons.appleIc,
                              text: 'Continue with Apple',
                              onTap: () {},
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
    );
  }
}
