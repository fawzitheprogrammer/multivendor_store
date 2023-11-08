import 'package:flutter/cupertino.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/animated_image_sizer.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/padding_and_margin.dart';
import 'forget_password_form.dart';
import 'forget_password_text.dart';

class ForgetPasswordBodyView extends StatelessWidget {
  const ForgetPasswordBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardOpen) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PaddingOrFont.size20.w,
            vertical: PaddingOrFont.size20.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedVector(
                imagePath: AppAssets.otpVerify,
                isKeyboardOpen: isKeyboardOpen,
              ),
              const ForgetPasswordTexts(),
              SizedBox(
                height: 14.h,
              ),
              const ForgetPasswordForm()
            ],
          ),
        ),
      ),
    );
  }
}
