import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multivendor_store/core/build_context_extension.dart';
import 'package:multivendor_store/core/constants.dart';

class VectorImage extends StatelessWidget {
  const VectorImage({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: SvgPicture.asset(
          imagePath,
          width: context.widthGreaterThan500
              ? imagePath != AppAssets.otpVerify
                  ? 250.w
                  : 350.w
              : imagePath != AppAssets.otpVerify
                  ? 450.w
                  : 650.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
