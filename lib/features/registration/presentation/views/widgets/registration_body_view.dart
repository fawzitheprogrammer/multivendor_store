import 'package:flutter/material.dart';
import 'package:multivendor_store/features/registration/presentation/views/widgets/registration_form_view.dart';


class RegistrationViewBody extends StatelessWidget {
  const RegistrationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: RegistrationForm(),
    );
  }
}
