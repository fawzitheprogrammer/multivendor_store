import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivendor_store/core/build_context_extension.dart';
import 'package:multivendor_store/localization/app_localization.dart';

import '../../../../../core/buttons/rounded_button_style.dart';
import '../../../../../core/padding_and_margin.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final gmailRegExp = RegExp(r'^[\w-]+@gmail\.com$');
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: PaddingOrFont.size8,
                  ),
                  filled: true,
                  fillColor: context.colorScheme!.onPrimary,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color:
                          context.colorScheme!.onBackground.withOpacity(0.15),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: context.colorScheme!.primary,
                    ),
                  ),
                  label: Text(
                    translate(key: 'Email', context: context),
                    style: context.medium!.copyWith(
                      fontSize: PaddingOrFont.size14.sp,
                      // fontFamily: 'Metropolis-Regular',
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: errorText.isNotEmpty
                          ? context.colorScheme!.error
                          : context.colorScheme!.primary,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: errorText.isNotEmpty
                          ? context.colorScheme!.error
                          : context.colorScheme!.primary,
                    ),
                  ),
                  errorText: errorText,
                  suffixIcon: errorText.isNotEmpty
                      ? Icon(
                          Icons.close,
                          color: context.colorScheme!.error,
                        )
                      : null,
                ),
                onFieldSubmitted: (value) {
                  setState(() {
                    if (gmailRegExp.hasMatch(value)) {
                      errorText = '';
                    } else {
                      errorText = translate(
                          key:
                              'Not a valid email address. Should be your@email.com',
                          context: context);
                    }
                  });
                },
              ),
              // const SizedBox(
              //   height: PaddingOrFont.size30,
              // ),
              ElevatedButton(
                style: roundedButtonStyle,
                onPressed: () {},
                child: Text(
                  translate(key: 'Send', context: context),
                  style: context.medium!.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
