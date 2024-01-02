import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multivendor_store/core/buttons/text_button_style.dart';
import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/core/notification.dart';
import 'package:multivendor_store/core/utils/app_route.dart';
import 'package:multivendor_store/localization/app_localization.dart';
import 'package:multivendor_store/manager/authentication-bloc/authentication_bloc_bloc.dart';

import '../../../../../../core/buttons/rounded_button_style.dart';

class LoginViewForm extends StatefulWidget {
  const LoginViewForm({super.key});

  @override
  State<LoginViewForm> createState() => _LoginViewFormState();
}

class _LoginViewFormState extends State<LoginViewForm> {
  bool obscureText = true;
  bool isLogin = true;

  // Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();

  // Email Regular expression
  final emailPattern =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Error label style
    TextStyle errorLabelStyle = context.regular!.copyWith(
      fontSize: PaddingOrFont.size12.spMin,
      color: context.colorScheme!.error,
    );
    return BlocConsumer<AuthenticationBlocBloc, AuthenticationBlocState>(
      builder: (context, state) => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: PaddingOrFont.size18.w),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      errorStyle: errorLabelStyle,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: PaddingOrFont.size8,
                      ),
                      filled: true,
                      fillColor: context.colorScheme!.onPrimary,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: context.colorScheme!.onBackground
                              .withOpacity(0.15),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: context.colorScheme!.primary,
                        ),
                      ),
                      label: Text(
                        translate(
                          key: 'Username or email',
                          context: context,
                        ),
                        style: context.medium!.copyWith(
                          fontSize: PaddingOrFont.size14.sp,
                          //fontFamily: 'Metropolis-Regular',
                        ),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (!emailPattern.hasMatch(value!)) {
                        return translate(
                          key: 'Email is not a correct format',
                          context: context,
                        );
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: PaddingOrFont.size10.h,
                  ),
                  CustomPasswordField(
                    passwordController: passwordController,
                    onTap: () {
                      if (mounted) {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      }
                    },
                    isObscure: obscureText,
                    label: 'Password',
                  ),
                  SizedBox(
                    height: PaddingOrFont.size10.h,
                  ),
                  !isLogin
                      ? CustomPasswordField(
                          passwordController: confirmPassword,
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            }
                          },
                          isObscure: obscureText,
                          label: 'Confirm Password',
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: PaddingOrFont.size8.h,
                  ),
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
                  //         GoRouter.of(context).push(AppRoute.kHome);
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
                  SizedBox(
                    height: PaddingOrFont.size8.h,
                  ),
                  ElevatedButton(
                    style: roundedButtonStyle.copyWith(
                      backgroundColor: MaterialStatePropertyAll(
                        context.colorScheme!.primaryContainer,
                      ),
                    ),
                    onPressed: () {
                      loginOrSignInFunction();
                    },
                    child: Text(
                      translate(key: 'Login', context: context),
                      style: context.medium!.copyWith(
                        color: context.colorScheme!.onBackground,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: PaddingOrFont.size10.h,
                  ),
                  Divider(
                    thickness: 1,
                    endIndent: 50.w,
                    indent: 50.w,
                    color: context.colorScheme!.onBackground.withOpacity(0.2),
                  ),
                  TextButton(
                    style: textButtonStyle,
                    onPressed: () {
                      if (mounted) {
                        setState(() {
                          isLogin = !isLogin;
                        });
                      }
                    },
                    child: Text(
                      translate(
                          key: isLogin ? 'Don\'t have an account ?' : 'Login',
                          context: context),
                      style: context.medium!.copyWith(
                          fontSize: PaddingOrFont.size14.sp,
                          color: context.colorScheme!.onBackground),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      listener: (context, state) {
        if (state is AuthenticationBlocSuccess) {
          if (state.userIsTaken) {
            notification('Failure', 'Username is taken', context);
          }
          
        } else if (state is AuthenticationBlocFailure) {
          notification(
            'Failure',
            translate(
              key: state.errorMessage,
              context: context,
            ),
            context,
          );
        }
      },
    );
  }

  // Login Flow
  void loginOrSignInFunction() {
    if (isLogin) {
      handleLogin();
    } else {
      handleSignUp();
    }
  }

  void handleLogin() {
    if (areLoginFieldsValid()) {
      BlocProvider.of<AuthenticationBlocBloc>(context).add(
        SignInUser(
          context: context,
          username: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );
    } else {
      showFailureNotification();
    }
  }

  void handleSignUp() {
    if (areSignUpFieldsValid()) {
      BlocProvider.of<AuthenticationBlocBloc>(context).add(
        SignUpUser(
          username: emailController.text.trim(),
          password: passwordController.text.trim(),
          context: context,
        ),
      );
    } else {
      showFailureNotification();
    }
  }

  bool areLoginFieldsValid() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        emailPattern.hasMatch(emailController.text.trim()) &&
        passwordController.text.length >= 6;
  }

  bool areSignUpFieldsValid() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty &&
        emailPattern.hasMatch(emailController.text.trim()) &&
        passwordController.text.length >= 6 &&
        passwordController.text.contains(confirmPassword.text);
  }

  void showFailureNotification() {
    notification(
      'Failure',
      translate(key: 'required fields', context: context),
      context,
    );
  }
}

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.passwordController,
    required this.onTap,
    required this.isObscure,
    required this.label,
  });

  final String label;
  final TextEditingController passwordController;
  final void Function()? onTap;
  final bool isObscure;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  @override
  Widget build(BuildContext context) {
    // Error label style
    TextStyle errorLabelStyle = context.regular!.copyWith(
      fontSize: PaddingOrFont.size12.spMin,
      color: context.colorScheme!.error,
    );
    return TextFormField(
      controller: widget.passwordController,
      decoration: InputDecoration(
        errorStyle: errorLabelStyle,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: PaddingOrFont.size8,
        ),
        filled: true,
        fillColor: context.colorScheme!.onPrimary,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: context.colorScheme!.onBackground.withOpacity(0.15),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: context.colorScheme!.primary,
          ),
        ),
        label: Text(
          translate(key: widget.label, context: context),
          style: context.medium!.copyWith(
            fontSize: PaddingOrFont.size14.sp,
            //fontFamily: 'Metropolis-Regular',
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: widget.onTap,
          child: Icon(
            widget.isObscure ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      obscureText: widget.isObscure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.length < 6) {
          return translate(
            key: 'Password length',
            context: context,
          );
        }
        return null;
      },
    );
  }
}
