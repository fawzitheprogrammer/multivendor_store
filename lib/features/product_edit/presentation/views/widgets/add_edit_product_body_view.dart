import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:multivendor_store/features/product_edit/presentation/views/widgets/add_edit_product_form_view.dart';

class AddOrEditProductViewBody extends StatelessWidget {
  const AddOrEditProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
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
          AddOrEditProductForm(),
        ],
      ),
    );
  }
}
