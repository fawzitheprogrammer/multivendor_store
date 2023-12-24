import 'package:flutter/material.dart';
import 'package:multivendor_store/core/appbar.dart';
import 'package:multivendor_store/features/product_edit/presentation/views/widgets/add_edit_product_body_view.dart';
import 'package:multivendor_store/features/store-profile/data/models/product_model.dart';

class AddOrEditProductView extends StatelessWidget {
  const AddOrEditProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: const SafeArea(
        child: AddOrEditProductViewBody(),
      ),
    );
  }
}

// class PasswordTextField extends StatelessWidget {
//   const PasswordTextField({
//     super.key,
//     required this.obscureText,
//     required this.onTap,
//   });

//   final bool obscureText;
//   final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: PaddingOrFont.size8,
//         ),
//         filled: true,
//         fillColor: context.colorScheme!.onPrimary,
//         enabledBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//             style: BorderStyle.solid,
//             color: Colors.black12,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             style: BorderStyle.solid,
//             color: context.colorScheme!.primary,
//           ),
//         ),
//         label: Text(
//           translate(key: 'Password', context: context),
//           style: context.medium!.copyWith(
//             fontSize: PaddingOrFont.size14.sp,
//           ),
//         ),
//         suffixIcon: GestureDetector(
//           onTap: onTap,
//           child: Icon(
//             obscureText ? Icons.visibility : Icons.visibility_off,
//           ),
//         ),
//       ),
//       obscureText: obscureText,
//       onChanged: (value) {},
//     );
//   }
// }

// class CustomTextFieldWidget extends StatelessWidget {
//   const CustomTextFieldWidget({
//     super.key,
//     required this.label,
//     required this.onChanged,
//     required bool isMultiLine,
//   });

//   final String label;
//   final void Function(String)? onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: PaddingOrFont.size8,
//         ),
//         filled: true,
//         fillColor: context.colorScheme!.onPrimary,
//         enabledBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//             style: BorderStyle.solid,
//             color: Colors.black12,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             style: BorderStyle.solid,
//             color: context.colorScheme!.primary,
//           ),
//         ),
//         label: Text(
//           translate(key: label, context: context),
//           style: context.medium!.copyWith(
//             fontSize: PaddingOrFont.size14.sp,
//           ),
//         ),
//       ),
//       onChanged: onChanged,
//     );
//   }
// }
