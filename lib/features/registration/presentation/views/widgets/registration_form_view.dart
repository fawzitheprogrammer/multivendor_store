import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:multivendor_store/core/build_context_extension.dart';
import 'package:multivendor_store/features/registration/presentation/views/registration.dart';
import 'package:multivendor_store/localization/app_localization.dart';

import '../../../../../core/buttons/rounded_button_style.dart';
import '../../../../../core/input_decoration.dart';
import '../../../../../core/padding_and_margin.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool obscureText = true;
  String selectedGender = '';
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController birthday = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: PaddingOrFont.size18.w),
          child: Form(
            child: Column(
              children: [
                CustomTextFieldWidget(
                  label: 'First name',
                  onChanged: (val) {},
                ),
                SizedBox(
                  height: PaddingOrFont.size10.h,
                ),
                CustomTextFieldWidget(
                  label: 'Last name',
                  onChanged: (val) {},
                ),
                SizedBox(
                  height: PaddingOrFont.size10.h,
                ),
                CustomTextFieldWidget(
                  label: 'Email',
                  onChanged: (val) {},
                ),
                SizedBox(
                  height: PaddingOrFont.size10.h,
                ),
                PasswordTextField(
                  obscureText: obscureText,
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
                SizedBox(
                  height: PaddingOrFont.size10.h,
                ),
                TextFormField(
                  readOnly: true,
                  controller: birthday,
                  onTap: () async {
                    DateTime? piacDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(DateTime.now().year),
                    );

                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(piacDate!);
                    setState(() {
                      birthday.text = formattedDate;
                    });
                  },
                  decoration: inputDecoration(context).copyWith(
                    label: Text(
                      translate(key: 'Choose birthday', context: context),
                      style: context.medium!.copyWith(
                        fontSize: PaddingOrFont.size14.sp,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      //text = value;
                    });
                  },
                ),
                SizedBox(
                  height: PaddingOrFont.size16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        activeColor: context.colorScheme!.primary,
                        title: Text(
                          translate(key: 'Male', context: context),
                          style: context.regular!.copyWith(),
                        ),
                        value: 'Male',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        activeColor: context.colorScheme!.primary,
                        title: Text(
                          translate(key: 'Female', context: context),
                          style: context.regular!.copyWith(),
                        ),
                        value: 'Female',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: roundedButtonStyle,
                  onPressed: () {},
                  child: Text(
                    translate(key: 'Sign Up', context: context),
                    style: context.medium!.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
