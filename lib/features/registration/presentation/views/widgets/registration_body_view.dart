import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:multivendor_store/core/animated_image_sizer.dart';
import 'package:multivendor_store/core/constants.dart';
import 'package:multivendor_store/core/build_context_extension.dart';
import 'package:multivendor_store/features/registration/presentation/views/widgets/registration_form_view.dart';
import 'package:multivendor_store/localization/app_localization.dart';

import '../../../../../core/login_and_registration_label.dart';

class RegistrationViewBody extends StatelessWidget {
  const RegistrationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardOpen) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedVector(
              imagePath: AppAssets.storeVectors,
              isKeyboardOpen: isKeyboardOpen,
            ),
            loginAndRegistrationLabel(
              text: Text(
                translate(key: 'Sign Up', context: context),
                style: context.bold!,
              ),
              isKeyBoardOpen: isKeyboardOpen,
            ),
            const RegistrationForm(),
          ],
        ),
      ),
    );
  }
}
