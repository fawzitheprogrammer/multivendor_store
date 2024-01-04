import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:multivendor_store/core/animated_image_sizer.dart';
import 'package:multivendor_store/core/buttons/text_button_style.dart';
import 'package:multivendor_store/core/check_if_user_is_connected.dart';
import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/core/loading_widget.dart';
import 'package:multivendor_store/core/notification.dart';
import 'package:multivendor_store/core/pick_image.dart';
import 'package:multivendor_store/core/text_fields/custom_text_field.dart';
import 'package:multivendor_store/features/registration/presentation/views/widgets/custom_drop_down.dart';
import 'package:multivendor_store/features/user-profile/data/models/user_model.dart';
import 'package:multivendor_store/manager/register-store/register_store_bloc.dart';

import 'image_container.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController businessName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  XFile? businessLicense, idFrontSide, idBackSide, profilePic;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? requiredFields;
  String? location;
  String? shopType;

  // Drop downs error border boolean
  bool isShopErrorBorder = false, isCityErrorBorder = false;

  // Image error border boolean
  bool isFrontIdSelected = false,
      isBackIdSelected = false,
      isProfilePic = false,
      isBusinessIdSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstName.dispose();
    lastName.dispose();
    businessName.dispose();
    phoneNumber.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Box Border
    final boxBorder = Border.all(
      color: context.colorScheme!.onBackground.withAlpha(40),
    );

    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardOpen) => Padding(
        padding: EdgeInsets.symmetric(horizontal: PaddingOrFont.size18.w),
        child: SizedBox(
          width: context.isWidthLessThan500 ? double.infinity : 500.spMin,
          child: BlocConsumer<RegisterStoreBloc, RegisterStoreState>(
            builder: (context, state) {
              if (state is RegisterStoreInitial) {
                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: PaddingOrFont.size18.spMin,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              pickSingleImage().then((value) {
                                if (mounted) {
                                  profilePic = value!;
                                  setState(() {});
                                }
                              });
                            },
                            child: AnimatedVector(
                              isKeyboardOpen: isKeyboardOpen,
                              child: CircleAvatar(
                                backgroundColor:
                                    context.colorScheme!.onBackground,
                                radius: context.isWidthLessThan500
                                    ? PaddingOrFont.size10.spMin * 5
                                    : PaddingOrFont.size10.spMin * 7,
                                backgroundImage: profilePic != null
                                    ? FileImage(File(profilePic!.path))
                                    : null,
                                child: profilePic == null
                                    ? Icon(
                                        Ionicons.image,
                                        color: context.colorScheme!.background,
                                        size: context.isWidthLessThan500
                                            ? PaddingOrFont.size10.spMin * 5
                                            : PaddingOrFont.size10.spMin * 7,
                                      )
                                    : Container(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: PaddingOrFont.size18.spMin,
                      ),
                      CustomTextFieldWidget(
                        controller: firstName,
                        label: 'First name',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'This field is required';
                          } else {
                            firstName.text = val;
                          }
                          return null;
                        },
                        onChanged: (p0) {
                          firstName.text = p0;
                        },
                        errorMessage: requiredFields,
                      ),
                      requiredFields != null
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                requiredFields ?? '',
                                style: context.regular!.copyWith(
                                  fontSize: PaddingOrFont.size12,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: PaddingOrFont.size10.h,
                      ),
                      CustomTextFieldWidget(
                        controller: lastName,
                        label: 'Last name',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'This field is required';
                          } else {
                            lastName.text = val;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: PaddingOrFont.size10.h,
                      ),
                      CustomTextFieldWidget(
                        controller: businessName,
                        label: 'Bussiness name',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'This field is required';
                          } else {
                            businessName.text = val;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: PaddingOrFont.size10.h,
                      ),
                      CustomTextFieldWidget(
                        controller: phoneNumber,
                        label: 'Phone number',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'This field is required';
                          } else {
                            phoneNumber.text = val;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: PaddingOrFont.size10.h,
                      ),
                      CustomDropDownList(
                        isErrorBordere: isShopErrorBorder,
                        boxBorder: boxBorder,
                        label: 'Shop Type',
                        theList: AppAssets.shopTypes,
                        dropDownValue: shopType,
                        onChanged: (val) {
                          if (mounted) {
                            setState(() {
                              shopType = val;
                              isShopErrorBorder = false;
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: PaddingOrFont.size10.h,
                      ),
                      CustomDropDownList(
                        isErrorBordere: isCityErrorBorder,
                        boxBorder: boxBorder,
                        label: 'Choose City',
                        theList: AppAssets.locations,
                        dropDownValue: location,
                        onChanged: (val) {
                          if (mounted) {
                            setState(() {
                              location = val;
                              isCityErrorBorder = false;
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: PaddingOrFont.size10.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                pickSingleImage().then((value) {
                                  if (mounted) {
                                    setState(() {
                                      idFrontSide = value;
                                      isFrontIdSelected = false;
                                    });
                                  }
                                });
                              },
                              child: ImageContainer(
                                boxBorder: boxBorder,
                                image: idFrontSide,
                                label: 'ID Front Side',
                                iconData: AppAssets.id,
                                isErrorBordere: isFrontIdSelected,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: PaddingOrFont.size10.spMin,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                pickSingleImage().then((value) {
                                  if (mounted) {
                                    setState(() {
                                      idBackSide = value;
                                      isBackIdSelected = false;
                                    });
                                  }
                                });
                              },
                              child: ImageContainer(
                                boxBorder: boxBorder,
                                image: idBackSide,
                                label: 'ID Back Side',
                                iconData: AppAssets.id,
                                isErrorBordere: isBackIdSelected,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: PaddingOrFont.size10.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          pickSingleImage().then((value) {
                            if (mounted) {
                              setState(() {
                                businessLicense = value;
                                isBusinessIdSelected = false;
                              });
                            }
                          });
                        },
                        child: ImageContainer(
                          boxBorder: boxBorder,
                          label: 'Business License',
                          image: businessLicense,
                          iconData: AppAssets.businessLicense,
                          isErrorBordere: isBusinessIdSelected,
                        ),
                      ),
                      SizedBox(
                        height: PaddingOrFont.size16.h,
                      ),
                      TextButton(
                        style: textButtonStyle.copyWith(
                          backgroundColor: MaterialStatePropertyAll(
                            context.colorScheme!.onBackground,
                          ),
                          minimumSize: MaterialStatePropertyAll(
                            Size(double.infinity, PaddingOrFont.size10.sp * 4),
                          ),
                        ),
                        onPressed: () {
                          _register();
                        },
                        child: Text(
                          'Register',
                          style: context.regular!.copyWith(
                            color: context.colorScheme!.background,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Loading();
              }
            },
            listener: (BuildContext context, RegisterStoreState state) {
              if (state is RegisterStoreFailure) {
                notification('Failure', state.errorMessage, context);
              }
            },
          ),
        ),
      ),
    );
  }

  void _register() {
    if (mounted) {
      setState(() {
        bool isValid = _formKey.currentState!.validate();
        isShopErrorBorder = shopType == null;
        isCityErrorBorder = location == null;
        isFrontIdSelected = idFrontSide == null;
        isBackIdSelected = idBackSide == null;
        isProfilePic = profilePic == null;
        isBusinessIdSelected = businessLicense == null;

        if (isValid &&
            !isShopErrorBorder &&
            !isCityErrorBorder &&
            !isFrontIdSelected &&
            !isBackIdSelected &&
            !isProfilePic &&
            !isBusinessIdSelected) {
          // Process registration
          // Storing data into an object
          StoreModel storeModel = StoreModel(
            fullNameOnId: '${firstName.text} ${lastName.text}',
            profilePicture: profilePic?.path,
            businessName: businessName.text,
            shopType: shopType,
            phoneNumber: phoneNumber.text,
            location: location,
            idFrontSide: idFrontSide?.path,
            idBackSide: idBackSide?.path,
            businessLicenseId: businessLicense?.path,
            isApproved: false,
          );

          BlocProvider.of<RegisterStoreBloc>(context).add(
            RegisterStore(
              profilePic: profilePic!,
              idFrontSide: idFrontSide!,
              idBackSide: idBackSide!,
              businessLicenseSide: businessLicense!,
              storeModel: storeModel,
              context: context,
            ),
          );
        } else {
          notification('Failure', 'Please fill all required fields', context);
        }
      });
    }
  }
}
