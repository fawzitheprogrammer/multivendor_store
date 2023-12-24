import 'package:flutter/material.dart';
import 'package:multivendor_store/features/registration/presentation/views/widgets/registration_body_view.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //appBar: appBar,
      body: SafeArea(
        child: Center(child: RegistrationViewBody()),
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

