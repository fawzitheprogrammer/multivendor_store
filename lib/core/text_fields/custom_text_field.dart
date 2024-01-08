import 'package:multivendor_store/localization/app_localization.dart';

import '../exports/exports.dart';

class CustomTextFieldWidget extends StatelessWidget {
  CustomTextFieldWidget({
    super.key,
    required this.label,
    this.onChanged,
    this.isMultiLine = false,
    this.controller,
    this.validator,
    this.errorMessage,
    this.textInputType,
    this.onSubmitted,
    this.onFieldSubmitted,
    this.focusNode,
  });

  final TextEditingController? controller;
  final String label;
  final void Function(String)? onChanged;
  final bool isMultiLine;
  final String? Function(String?)? validator;
  final String? errorMessage;
  final TextInputType? textInputType;
  final void Function(String)? onSubmitted;
  void Function()? onFieldSubmitted;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      maxLines: isMultiLine ? 5 : 1,
      decoration: InputDecoration(
        hintStyle: context.regular,
        hintText:
            label == 'Brands' ? translate(key: label, context: context) : '',
        errorText: errorMessage,
        errorStyle: context.regular!
            .copyWith(fontSize: PaddingOrFont.size12.spMin, color: Colors.red),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: context.isWidthLessThan500 ? 0 : PaddingOrFont.size20.spMin,
          horizontal: PaddingOrFont.size8,
        ),
        filled: true,
        fillColor: context.colorScheme!.onPrimary,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              style: BorderStyle.solid,
              color: context.colorScheme!.onBackground.withAlpha(40)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              style: BorderStyle.solid, color: context.colorScheme!.primary),
        ),
        label: Text(
          translate(key: label, context: context),
          style: context.medium!.copyWith(
            fontSize: PaddingOrFont.size14.sp,
          ),
        ),
      ),
      onChanged: onChanged,
      validator: validator,
      onEditingComplete: onFieldSubmitted,
      focusNode: focusNode,
    );
  }
}
