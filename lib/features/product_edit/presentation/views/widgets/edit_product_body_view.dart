import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:multivendor_store/core/animated_image_sizer.dart';
import 'package:multivendor_store/core/constants.dart';
import 'package:multivendor_store/core/build_context_extension.dart';
import 'package:multivendor_store/features/product_edit/presentation/views/widgets/edit_product_form_view.dart';
import 'package:multivendor_store/features/registration/presentation/views/widgets/registration_form_view.dart';
import 'package:multivendor_store/localization/app_localization.dart';

import '../../../../../core/login_and_registration_label.dart';

class EditProductViewBody extends StatelessWidget {
  const EditProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardOpen) => const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // AnimatedVector(
            //   imagePath: AppAssets.storeVectors,
            //   isKeyboardOpen: isKeyboardOpen,
            // ),
            // loginAndRegistrationLabel(
            //   text: Text(
            //     translate(key: 'Sign Up', context: context),
            //     style: context.bold!,
            //   ),
            //   isKeyBoardOpen: isKeyboardOpen,
            // ),
            EditProductForm(),
          ],
        ),
      ),
    );
  }
}
