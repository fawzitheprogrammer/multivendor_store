import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/localization/app_localization.dart';
import '../../../../../core/animated_image_sizer.dart';
import '../../../../../core/login_and_registration_label.dart';
import 'login_view_form.dart';

class LoginBodyView extends StatelessWidget {
  const LoginBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardOpen) => SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: context.isWidthLessThan500 ? double.infinity : 600.spMin,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedVector(
                  child: AppAssets.storeVectors,
                  isKeyboardOpen: isKeyboardOpen,
                ),
                loginAndRegistrationLabel(
                  text: Text(
                    translate(key: 'Login', context: context),
                    style: context.bold!,
                  ),
                  isKeyBoardOpen: isKeyboardOpen,
                ),
                const LoginViewForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
