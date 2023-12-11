import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivendor_store/core/build_context_extension.dart';
import 'package:multivendor_store/core/constants.dart';
import 'package:multivendor_store/core/pick_image.dart';
import 'package:multivendor_store/features/registration/presentation/views/registration.dart';
import 'package:multivendor_store/localization/app_localization.dart';

import '../../../../../core/buttons/rounded_button_style.dart';
import '../../../../../core/padding_and_margin.dart';

class EditProductForm extends StatefulWidget {
  const EditProductForm({super.key});

  @override
  State<EditProductForm> createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  bool obscureText = true;
  String selectedGender = '';
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController birthday = TextEditingController();
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: PaddingOrFont.size18.w),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.widthGreaterThan500 ? 0 : 100.w,
            ),
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: PaddingOrFont.size10.h,
                  ),
                  const ProductImage(),
                  SizedBox(
                    height: PaddingOrFont.size10.h - 4,
                  ),
                  CustomTextFieldWidget(
                    label: 'Product Name',
                    onChanged: (val) {},
                  ),
                  SizedBox(
                    height: PaddingOrFont.size10.h,
                  ),
                  Container(
                    constraints: BoxConstraints(maxHeight: 50.h),
                    decoration: BoxDecoration(
                        color: context.colorScheme!.onPrimary,
                        border: Border.all(
                          width: 1.5.w,
                          color: context.colorScheme!.primary.withAlpha(30),
                        ),
                        borderRadius: BorderRadius.circular(4.r)),
                    padding: EdgeInsets.symmetric(
                        horizontal: PaddingOrFont.size10.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButton(
                            underline: Container(),
                            isExpanded: true,
                            value: selectedOption.isNotEmpty
                                ? selectedOption
                                : AppAssets.categoriesMap.keys.elementAt(0),
                            onChanged: (newValue) {
                              setState(() {
                                selectedOption = newValue!;
                              });
                            },
                            items: List.generate(
                              AppAssets.categoriesMap.keys.length,
                              (index) => DropdownMenuItem(
                                value: AppAssets.categoriesMap.keys
                                    .elementAt(index),
                                child: Text(
                                  translate(
                                    key: AppAssets.categoriesMap.keys
                                        .elementAt(index),
                                    context: context,
                                  ),
                                  style: context.regular!.copyWith(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: PaddingOrFont.size10.h,
                  ),
                  CustomTextFieldWidget(
                    label: 'Price',
                    onChanged: (val) {},
                  ),
                  SizedBox(
                    height: PaddingOrFont.size10.h,
                  ),
                  CustomTextFieldWidget(
                    label: 'Quantity',
                    onChanged: (val) {},
                  ),
                  SizedBox(
                    height: PaddingOrFont.size10.h,
                  ),
                  CustomTextFieldWidget(
                    isMultiLine: true,
                    label: 'Short Description',
                    onChanged: (val) {},
                  ),
                  SizedBox(
                    height: PaddingOrFont.size10.h,
                  ),
                  CustomTextFieldWidget(
                    label: 'Offer Price',
                    onChanged: (val) {},
                  ),
                  // PasswordTextField(
                  //   obscureText: obscureText,
                  //   onTap: () {
                  //     setState(() {
                  //       obscureText = !obscureText;
                  //     });
                  //   },
                  // ),
                  // SizedBox(
                  //   height: PaddingOrFont.size10.h,
                  // ),
                  // TextFormField(
                  //   readOnly: true,
                  //   controller: birthday,
                  //   onTap: () async {
                  //     DateTime? piacDate = await showDatePicker(
                  //       context: context,
                  //       initialDate: DateTime(2000),
                  //       firstDate: DateTime(1950),
                  //       lastDate: DateTime(DateTime.now().year),
                  //     );

                  //     String formattedDate =
                  //         DateFormat('yyyy-MM-dd').format(piacDate!);
                  //     setState(() {
                  //       birthday.text = formattedDate;
                  //     });
                  //   },
                  //   decoration: inputDecoration(context).copyWith(
                  //     label: Text(
                  //       translate(key: 'Choose birthday', context: context),
                  //       style: context.medium!.copyWith(
                  //         fontSize: PaddingOrFont.size14.sp,
                  //       ),
                  //     ),
                  //   ),
                  //   onChanged: (value) {
                  //     setState(() {
                  //       //text = value;
                  //     });
                  //   },
                  // ),
                  SizedBox(
                    height: PaddingOrFont.size16.h,
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: RadioListTile<String>(
                  //         activeColor: context.colorScheme!.primary,
                  //         title: Text(
                  //           translate(key: 'Male', context: context),
                  //           style: context.regular!.copyWith(),
                  //         ),
                  //         value: 'Male',
                  //         groupValue: selectedGender,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             selectedGender = value!;
                  //           });
                  //         },
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: RadioListTile<String>(
                  //         activeColor: context.colorScheme!.primary,
                  //         title: Text(
                  //           translate(key: 'Female', context: context),
                  //           style: context.regular!.copyWith(),
                  //         ),
                  //         value: 'Female',
                  //         groupValue: selectedGender,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             selectedGender = value!;
                  //           });
                  //         },
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  ElevatedButton(
                    style: roundedButtonStyle,
                    onPressed: () {},
                    child: Text(
                      translate(key: 'Post', context: context),
                      style: context.medium!.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProductImage extends StatefulWidget {
  const ProductImage({super.key});

  @override
  State<ProductImage> createState() => ProductImageState();
}

class ProductImageState extends State<ProductImage> {
  List<File?> imagePath = [];
  void selectImage() async {
    imagePath = await pickMultiImage();
    setState(() {});
  }

  double imageRadius = PaddingOrFont.size30.r * 3;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectImage,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: context.colorScheme!.primary.withAlpha(30),
          ),
          borderRadius: BorderRadius.circular(14.r),
        ),
        height: context.widthGreaterThan500 ? 150.h : 250.h,
        width: double.infinity,
        child: imagePath != null
            ? GridView.builder(
                itemCount: imagePath.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(4.w),
                  child: SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: Image.file(
                      imagePath[index]!,
                      fit: BoxFit.cover,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
              )
            : const Center(
                child: Icon(Icons.image),
              ),
      ),
    );
  }

  Widget addIcon() {
    return Align(
      alignment: Alignment.bottomRight,
      child: CircleAvatar(
        radius: PaddingOrFont.size10.r * 2,
        backgroundColor: context.colorScheme!.background,
        child: Icon(
          Icons.add,
          color: context.colorScheme!.primary,
        ),
      ),
    );
  }
}
