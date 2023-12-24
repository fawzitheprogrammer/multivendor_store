import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:multivendor_store/core/build_context_extension.dart';
import 'package:multivendor_store/core/firebase_package_helper.dart';
import 'package:multivendor_store/core/notification.dart';
import 'package:multivendor_store/core/padding_and_margin.dart';
import 'package:multivendor_store/core/utils/app_route.dart';
import 'package:multivendor_store/manager/google-auth-bloc/google_auth_bloc.dart';

class LoginViewForm extends StatefulWidget {
  const LoginViewForm({super.key});

  @override
  State<LoginViewForm> createState() => _LoginViewFormState();
}

class _LoginViewFormState extends State<LoginViewForm> {
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<GoogleAuthBloc, GoogleAuthState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: PaddingOrFont.size18.w),
              child: SizedBox(
                child: Form(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<GoogleAuthBloc>(context).add(
                            SignInUsingGmail(ctx: context),
                          );

                          if (firebaseAuth.currentUser != null) {
                            GoRouter.of(context).push(AppRoute.kHome);
                          }
                        },
                        child: Container(
                          height:
                              context.isWidthLessThan500 ? 50.spMin : 60.spMin,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: context.colorScheme!.primary),
                            borderRadius:
                                BorderRadius.circular(PaddingOrFont.size10.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Ionicons.logo_google,
                                size: PaddingOrFont.size16.spMin,
                              ),
                              SizedBox(
                                width: PaddingOrFont.size10.spMin - 4,
                              ),
                              Text(
                                'Sign in with Gmail',
                                style: context.regular,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (BuildContext context, GoogleAuthState state) {
            if (state is GoogleAuthFailure) {
              notification('Failure', state.errorMessage, context);
            }
          },
        )
      ],
    );
  }
}

// TextFormField(
//   decoration: InputDecoration(
//     contentPadding: const EdgeInsets.symmetric(
//       horizontal: PaddingOrFont.size8,
//     ),
//     filled: true,
//     fillColor: context.colorScheme!.onPrimary,
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//         style: BorderStyle.solid,
//         color:
//             context.colorScheme!.onBackground.withOpacity(0.15),
//       ),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//         style: BorderStyle.solid,
//         color: context.colorScheme!.primary,
//       ),
//     ),
//     label: Text(
//       translate(
//         key: 'Username or email',
//         context: context,
//       ),
//       style: context.medium!.copyWith(
//         fontSize: PaddingOrFont.size14.sp,
//         //fontFamily: 'Metropolis-Regular',
//       ),
//     ),
//   ),
//   onChanged: (value) {
//     setState(() {
//       //text = value;
//     });
//   },
// ),
// SizedBox(
//   height: PaddingOrFont.size10.h,
// ),
// TextFormField(
//   decoration: InputDecoration(
//     contentPadding: const EdgeInsets.symmetric(
//       horizontal: PaddingOrFont.size8,
//     ),
//     filled: true,
//     fillColor: context.colorScheme!.onPrimary,
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//         style: BorderStyle.solid,
//         color:
//             context.colorScheme!.onBackground.withOpacity(0.15),
//       ),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//         style: BorderStyle.solid,
//         color: context.colorScheme!.primary,
//       ),
//     ),
//     label: Text(
//       translate(key: 'Password', context: context),
//       style: context.medium!.copyWith(
//         fontSize: PaddingOrFont.size14.sp,
//         //fontFamily: 'Metropolis-Regular',
//       ),
//     ),
//     suffixIcon: GestureDetector(
//       onTap: () {
//         setState(() {
//           obscureText = !obscureText;
//         });
//       },
//       child: Icon(
//         obscureText ? Icons.visibility : Icons.visibility_off,
//       ),
//     ),
//   ),
//   obscureText: obscureText,
//   onChanged: (value) {},
// ),
// SizedBox(
//   height: PaddingOrFont.size8.h,
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.end,
//   children: [
//     TextButton(
//       style: textButtonStyle.copyWith(
//         minimumSize: MaterialStatePropertyAll(
//           Size(
//             PaddingOrFont.size30.w,
//             PaddingOrFont.size30.w * 2,
//           ),
//         ),
//       ),
//       onPressed: () {
//         GoRouter.of(context).push(AppRoute.kForgetPassword);
//       },
//       child: Text(
//         translate(key: 'Forgot password ?', context: context),
//         style: context.medium!.copyWith(
//           fontSize: PaddingOrFont.size14.sp,
//           color: context.colorScheme!.onBackground,
//         ),
//       ),
//     )
//   ],
// ),
// SizedBox(
//   height: PaddingOrFont.size8.h,
// ),
// ElevatedButton(
//   style: roundedButtonStyle,
//   onPressed: () {
//     GoRouter.of(context).push('/');
//   },
//   child: Text(
//     translate(key: 'Login', context: context),
//     style: context.medium!.copyWith(color: Colors.white),
//   ),
// ),
// SizedBox(
//   height: PaddingOrFont.size10.h,
// ),
// Divider(
//   thickness: 1,
//   endIndent: 50.w,
//   indent: 50.w,
//   color: context.colorScheme!.onBackground.withOpacity(0.2),
// ),
// TextButton(
//   style: textButtonStyle,
//   onPressed: () {
//     GoRouter.of(context).push(AppRoute.kRegistrationView);
//   },
//   child: Text(
//     translate(
//         key: 'Don\'t have an account ?', context: context),
//     style: context.medium!.copyWith(
//         fontSize: PaddingOrFont.size14.sp,
//         color: context.colorScheme!.onBackground),
//   ),
// ),
