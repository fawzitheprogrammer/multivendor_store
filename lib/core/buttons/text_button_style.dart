import 'package:flutter/material.dart';

ButtonStyle textButtonStyle = const ButtonStyle(
  padding: MaterialStatePropertyAll(EdgeInsets.zero),
  minimumSize: MaterialStatePropertyAll(
    Size(double.infinity, 48),
  ),
  overlayColor: MaterialStatePropertyAll(
    Colors.transparent,
  ),
);
