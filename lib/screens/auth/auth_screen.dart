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
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.backgroundLogin.path,
                fit: BoxFit.cover),
          ),
          Positioned.fill(
              top: 86.0.h,
              child: isLogin ? const LoginForm() : const SignupForm())
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:travel_app/screens/auth/bloc/auth_bloc.dart';

// class SignupScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => AuthBloc(),
//         child: SignupForm(),
//       ),
//     );
//   }
// }

// class SignupForm extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final authBloc = BlocProvider.of<AuthBloc>(context);

//     return BlocBuilder<AuthBloc, AuthState>(
//       builder: (context, state) {
//         if (state is SingupLoading) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (state is SignupSuccess) {
//           return const Center(
//             child:  Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Signup Successful!',
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 // Add other UI components or navigate to another screen
//               ],
//             ),
//           );
//         } else if (state is SignupFailureState) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Signup Failed: ${state.errorMessage}',
//                   style: const TextStyle(fontSize: 20),
//                 ),
//                 // Add retry button or other UI components for failure state
//               ],
//             ),
//           );
//         } else {
//           return Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextField(
//                   controller: emailController,
//                   decoration: const InputDecoration(labelText: 'Email'),
//                 ),
//                 TextField(
//                   controller: passwordController,
//                   decoration: const InputDecoration(labelText: 'Password'),
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     authBloc.add(SignupEvent(
//                       email: emailController.text.trim(),
//                       password: passwordController.text.trim(),
//                     ));
//                   },
//                   child: const Text('Sign Up'),
//                 ),
//               ],
//             ),
//           );
//         }
//       },
//     );
//   }
// }
