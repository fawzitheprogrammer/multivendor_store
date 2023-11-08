import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivendor_store/core/build_context_extension.dart';
import 'package:multivendor_store/localization/app_localization.dart';

import '../../../../../core/padding_and_margin.dart';

class ForgetPasswordTexts extends StatelessWidget {
  const ForgetPasswordTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translate(key: 'Forgot password ?', context: context),
          style: context.bold,
        ),
        SizedBox(
          height: PaddingOrFont.size14.h,
        ),
        Text(
          translate(
              key:
                  'Please, enter your email address. You will receive a link to create a new password via email.',
              context: context),
          style: context.regular,
        )
      ],
    );
  }
}
