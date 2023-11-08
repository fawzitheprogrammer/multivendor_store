import 'package:flutter/material.dart';
import 'package:multivendor_store/core/appbar.dart';
import 'package:multivendor_store/features/forget-password/presentation/views/widgets/forget_password_body_view.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: const SafeArea(
        child: ForgetPasswordBodyView(),
      ),
    );
  }
}
