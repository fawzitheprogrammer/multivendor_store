import 'package:flutter/material.dart';
import 'package:multivendor_store/core/build_context_extension.dart';
import 'package:multivendor_store/core/padding_and_margin.dart';

InputDecoration inputDecoration(BuildContext context) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: PaddingOrFont.size8,
    ),
    filled: true,
    fillColor: context.colorScheme!.onPrimary,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: context.colorScheme!.onBackground.withOpacity(0.15),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: context.colorScheme!.primary,
      ),
    ),
  );
}
