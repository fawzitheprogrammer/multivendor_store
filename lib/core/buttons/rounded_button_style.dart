import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ButtonStyle roundedButtonStyle = ButtonStyle(
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.r),
    ),
  ),
  minimumSize: const MaterialStatePropertyAll(
    Size(double.infinity, 48),
  ),
  elevation: const MaterialStatePropertyAll(0.0),
);
