import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/components/button/app_button.dart';
import 'package:travel_app/components/dialog/app_dialog.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:travel_app/constants/app_style.dart';
import 'package:travel_app/gen/assets.gen.dart';
import 'package:travel_app/screens/auth/auth_screen.dart';
import 'package:travel_app/screens/auth/bloc/auth_bloc.dart';
import 'package:travel_app/screens/auth/enters_information_screen.dart';
import 'package:travel_app/components/text_field/app_text_field.dart';
import 'package:travel_app/utils/validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthBloc>(context);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSignInSuccessState) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const EntersInformation(),
            ),
          );
        }
        if (state is AuthSignInFailureState) {
          AppDialog.dialog(context,
              title: 'Sign in failed',
              content: 'Please check your email and password again!',
              actions: [
                TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: const Text('OK'),
                ),
              ]);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: SvgPicture.asset(
                    Assets.icons.logoSvg,
                    // ignore: deprecated_member_use
                    color: AppColor.white,
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
                          AppTextField(
                            controller: emailController,
                            text1: 'Email',
                            text2: '*',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) => Validator.checkEmail(value),
                          ),
                          SizedBox(height: 25.0.h),
                          AppTextField(
                            textInputAction: TextInputAction.done,
                            controller: passwordController,
                            text1: 'Password',
                            text2: '*',
                            obscureText: true,
                            validator: (value) => Validator.checkIsEmpty(value),
                          ),
                          SizedBox(height: 55.0.h),
                          Center(
                            child: AppButton(
                              isLoading: state is AuthSignInLoadingState
                                  ? true
                                  : false,
                              text: 'Login',
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  bloc.add(
                                    LoginEvent(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
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
                                  text: 'Sign up',
                                  style: AppStyle.regular14.copyWith(
                                      color: AppColor.primaryColor,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w800),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () =>
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const AuthScreen(
                                                    isLogin: false),
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
