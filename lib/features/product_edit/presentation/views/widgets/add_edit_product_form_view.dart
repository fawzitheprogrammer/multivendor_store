import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:multivendor_store/core/animated_image_sizer.dart';
import 'package:multivendor_store/core/build_context_extension.dart';
import 'package:multivendor_store/core/buttons/text_button_style.dart';
import 'package:multivendor_store/core/constants.dart';
import 'package:multivendor_store/core/firebase/download_file.dart';
import 'package:multivendor_store/core/firebase/logged_user.dart';
import 'package:multivendor_store/core/firebase/translate_incoming_data.dart';
import 'package:multivendor_store/core/loading_widget.dart';
import 'package:multivendor_store/core/notification.dart';
import 'package:multivendor_store/core/pick_image.dart';
import 'package:multivendor_store/core/text_fields/custom_text_field.dart';
import 'package:multivendor_store/core/text_responsive.dart';
import 'package:multivendor_store/features/product_edit/presentation/view_models/clothing_size.dart';
import 'package:multivendor_store/features/product_edit/presentation/views/widgets/product_image.dart';
import 'package:multivendor_store/features/store-profile/data/models/product_model.dart';
import 'package:multivendor_store/localization/app_localization.dart';
import 'package:multivendor_store/manager/store-product/store_product_bloc.dart';

import '../../../../../core/padding_and_margin.dart';

class AddOrEditProductForm extends StatefulWidget {
  const AddOrEditProductForm({super.key});

  @override
  State<AddOrEditProductForm> createState() => _AddOrEditProductFormState();
}

class _AddOrEditProductFormState extends State<AddOrEditProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController productNameKurdish = TextEditingController();
  TextEditingController productNameEnglish = TextEditingController();
  TextEditingController productNameArabic = TextEditingController();
  TextEditingController shortKurdishDescripttion = TextEditingController();
  TextEditingController shortArabicDescripttion = TextEditingController();
  TextEditingController shortEnglishDescripttion = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController qty = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController brandName = TextEditingController();
  TextEditingController tags = TextEditingController();
  String? selectedOption;
  List<File> imagePath = [];
  bool isCreateProduct = true;

  // Clothing size
  List<ClothingSize> selectedClothingSize = [];
  List<ClothingSize> clothingSize = List.generate(
    AppAssets.clothingSizes.length,
    (index) =>
        ClothingSize(title: AppAssets.clothingSizes[index], isActive: false),
  );

  Future<List<File>> getImages(List<String> urls) async {
    if (imagePath.isEmpty) {
      imagePath = await downloadFiles(urls);
    }

    return imagePath;
  }

  // Shoe size
  List<String> selectedShoeSizes = [];

  List<String> shoeSizes() {
    List<String> generatedSize = [];

    for (int i = 25; i < 51; i++) {
      generatedSize.add(i.toString());
    }

    return generatedSize;
  }

  // Regular Expression to accept only numbrers
  RegExp regExp = RegExp(r'^\d+$');

  @override
  void dispose() {
    super.dispose();
    category.dispose();
    price.dispose();
    productNameKurdish.dispose();
    productNameEnglish.dispose();
    productNameArabic.dispose();
    shortKurdishDescripttion.dispose();
    shortArabicDescripttion.dispose();
    shortEnglishDescripttion.dispose();
    discount.dispose();
    qty.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboarOpen) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<StoreProductBloc, StoreProductState>(
            builder: (context, state) {
              if (state is SingleProductState) {
                if (state.product != null) {
                  isCreateProduct = false;
                  // getProductData(state.product!);
                }

                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: PaddingOrFont.size18.w),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.isWidthLessThan500 ? 0 : 100.w,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: PaddingOrFont.size10.h,
                          ),
                          AnimatedVector(
                              isKeyboardOpen: isKeyboarOpen,
                              child: ProductImage(
                                onTap: () async {
                                  if (mounted) {
                                    imagePath = await pickMultiImage();
                                    setState(() {});
                                  }
                                },
                                imagePath: imagePath,
                              )),
                          SizedBox(
                            height: PaddingOrFont.size10.h - 4,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: CustomTextFieldWidget(
                                  controller: productNameKurdish,
                                  label: 'Product Name Kurdish',
                                  validator: (val) {
                                    return checkEmptyFields(
                                      controller: productNameKurdish,
                                      val: val!,
                                      locale: 'ku',
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: PaddingOrFont.size10.spMin - 5,
                              ),
                              Expanded(
                                child: CustomTextFieldWidget(
                                  controller: productNameArabic,
                                  label: 'Product Name Arabic',
                                  validator: (val) {
                                    return checkEmptyFields(
                                        controller: productNameArabic,
                                        val: val!,
                                        locale: 'ar');
                                  },
                                ),
                              ),
                              SizedBox(
                                width: PaddingOrFont.size10.spMin - 5,
                              ),
                              Expanded(
                                child: CustomTextFieldWidget(
                                  controller: productNameEnglish,
                                  label: 'Product Name English',
                                  validator: (val) {
                                    return checkEmptyFields(
                                        controller: productNameEnglish,
                                        val: val!,
                                        locale: 'en');
                                  },
                                ),
                              ),
                              SizedBox(
                                width: PaddingOrFont.size10.spMin - 5,
                              ),
                            ],
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
                                  color: context.colorScheme!.primary
                                      .withAlpha(30),
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
                                    hint: Text(translate(
                                        key: 'Category', context: context)),
                                    value: selectedOption,
                                    onChanged: (newValue) {
                                      if (mounted) {
                                        setState(() {
                                          selectedOption = newValue!;
                                        });
                                      } else {
                                        return;
                                      }
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
                          if (selectedOption ==
                                  AppAssets.categoriesMap.keys.elementAt(0) ||
                              selectedOption ==
                                  AppAssets.categoriesMap.keys.elementAt(1) ||
                              selectedOption ==
                                  AppAssets.categoriesMap.keys.elementAt(2))
                            Row(
                              children:
                                  List.generate(clothingSize.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (mounted) {
                                      setState(() {
                                        if (selectedClothingSize
                                            .contains(clothingSize[index])) {
                                          selectedClothingSize
                                              .remove(clothingSize[index]);
                                        } else {
                                          selectedClothingSize
                                              .add(clothingSize[index]);
                                        }
                                      });
                                    }
                                  },
                                  child: WordBasedWidthContainer(
                                    text: clothingSize[index].title,
                                    isActive: selectedClothingSize
                                        .contains(clothingSize[index]),
                                  ),
                                );
                              }),
                            )
                          else
                            const SizedBox(),
                          if (selectedOption ==
                              AppAssets.categoriesMap.keys.elementAt(4))
                            SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children:
                                    List.generate(shoeSizes().length, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (mounted) {
                                        setState(() {
                                          if (selectedShoeSizes.contains(
                                              shoeSizes()[index].toString())) {
                                            selectedShoeSizes.remove(
                                                shoeSizes()[index].toString());
                                          } else {
                                            selectedShoeSizes.add(
                                                shoeSizes()[index].toString());
                                          }
                                        });
                                      }
                                    },
                                    child: WordBasedWidthContainer(
                                      text: shoeSizes()
                                          .elementAt(index)
                                          .toString(),
                                      isActive: selectedShoeSizes
                                          .contains(shoeSizes()[index]),
                                    ),
                                  );
                                }),
                              ),
                            )
                          else
                            const SizedBox(),
                          SizedBox(
                            height: PaddingOrFont.size10.h,
                          ),
                          CustomTextFieldWidget(
                            controller: price,
                            label: 'Price',
                            validator: (val) {
                              return checkFiledsWithDigitType(
                                  controller: price, val: val!);
                            },
                            textInputType: TextInputType.number,
                          ),
                          SizedBox(
                            height: PaddingOrFont.size10.h,
                          ),
                          CustomTextFieldWidget(
                            controller: qty,
                            label: 'Quantity',
                            validator: (val) {
                              return checkFiledsWithDigitType(
                                  controller: qty, val: val ?? '0');
                            },
                            textInputType: TextInputType.number,
                          ),
                          SizedBox(
                            height: PaddingOrFont.size10.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFieldWidget(
                                  controller: shortKurdishDescripttion,
                                  isMultiLine: true,
                                  label: 'ShortDescription_Kurdish',
                                  validator: (val) {
                                    return checkEmptyFields(
                                      val: val ?? '',
                                      controller: shortKurdishDescripttion,
                                      locale: 'ku',
                                    );
                                  },
                                  textInputType: TextInputType.text,
                                ),
                              ),
                              SizedBox(
                                width: PaddingOrFont.size10.spMin - 5,
                              ),
                              Expanded(
                                child: CustomTextFieldWidget(
                                  controller: shortArabicDescripttion,
                                  isMultiLine: true,
                                  label: 'ShortDescription_Arabic',
                                  validator: (val) {
                                    return checkEmptyFields(
                                      val: val ?? '',
                                      controller: shortArabicDescripttion,
                                      locale: 'ar',
                                    );
                                  },
                                  textInputType: TextInputType.text,
                                ),
                              ),
                              SizedBox(
                                width: PaddingOrFont.size10.spMin - 5,
                              ),
                              Expanded(
                                child: CustomTextFieldWidget(
                                  controller: shortEnglishDescripttion,
                                  isMultiLine: true,
                                  label: 'ShortDescription_English',
                                  validator: (val) {
                                    return checkEmptyFields(
                                      val: val ?? '',
                                      controller: shortEnglishDescripttion,
                                      locale: 'en',
                                    );
                                  },
                                  textInputType: TextInputType.text,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: PaddingOrFont.size10.h,
                          ),
                          CustomTextFieldWidget(
                            controller: discount,
                            label: 'Offer Price',
                            validator: (val) {
                              return checkFiledsWithDigitType(
                                  controller: price, val: val!);
                            },
                            textInputType: TextInputType.number,
                          ),
                          SizedBox(
                            height: PaddingOrFont.size16.h,
                          ),
                          TextButton(
                            style: textButtonStyle.copyWith(
                              backgroundColor: MaterialStatePropertyAll(
                                context.colorScheme!.onBackground,
                              ),
                            ),
                            onPressed: () {
                              print(isCreateProduct);
                              if (_formKey.currentState!.validate()) {
                                Product product = Product(
                                  productId: '',
                                  productName: {
                                    "ku": productNameKurdish.text,
                                    "en": productNameEnglish.text,
                                    "ar": productNameArabic.text,
                                  },
                                  productCategory:
                                      selectedOption ?? 'Uncategorized',
                                  productImages: [],
                                  productPrice: price.text,
                                  productQuantity: qty.text,
                                  productShortDescription: {
                                    "ku": shortKurdishDescripttion.text,
                                    "en": shortEnglishDescripttion.text,
                                    "ar": shortArabicDescripttion.text,
                                  },
                                  offerPrice: discount.text,
                                  rating: '0.0',
                                  brandName: '',
                                  vendorName: firebaseUser!.uid,
                                  tags: [],
                                  clothingSize:
                                      getClothesSize(selectedClothingSize),
                                  shoeSize: selectedShoeSizes,
                                );

                                if (isCreateProduct == true) {
                                  BlocProvider.of<StoreProductBloc>(context)
                                      .add(
                                    CreateProduct(
                                      product: product,
                                      file: imagePath,
                                      context: context,
                                    ),
                                  );
                                } else {
                                  print(product.productId);
                                  BlocProvider.of<StoreProductBloc>(context)
                                      .add(
                                    UpdateProduct(
                                      productID: state.product!.productId,
                                      product: product,
                                      file: imagePath,
                                      context: context,
                                    ),
                                  );
                                }
                              }
                            },
                            child: Text(
                              translate(
                                  key: isCreateProduct ? 'Post' : 'Update',
                                  context: context),
                              style: context.medium!.copyWith(
                                  color: context.colorScheme!.background),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: const Loading(),
                );
              }
            },
            listener: (context, state) {
              if (state is StoreProductFailure) {
                notification('Failure', state.errorMessage, context);
              }
            },
          ),
        ],
      ),
    );
  }

  String? checkFiledsWithDigitType(
      {required TextEditingController controller, required String val}) {
    if (regExp.hasMatch(val)) {
      controller.text = val;
    } else {
      return translate(key: 'fieldValidationMessage', context: context);
    }
    return null;
  }

  String? checkEmptyFields({
    required TextEditingController controller,
    required String val,
    required String locale,
  }) {
    if (val.isNotEmpty) {
      controller.text = val;
    } else {
      return translate(key: 'fieldEmptyErrorMessage_$locale', context: context);
    }
    return null;
  }

  List<String> getClothesSize(List<ClothingSize> clothingSize) {
    List<String> allSizes = [];

    for (int i = 0; i < clothingSize.length; i++) {
      allSizes.add(clothingSize[i].title);
    }

    return allSizes;
  }

  void getProductData(Product product) {
    translateValue(productNameKurdish, 'ku', product);
    translateValue(productNameArabic, 'ar', product);
    translateValue(productNameEnglish, 'en', product);
    selectedOption = product.productCategory;
    selectedShoeSizes = product.shoeSize!;
    for (int i = 0; i < product.clothingSize!.length; i++) {
      selectedClothingSize
          .add(ClothingSize(title: product.clothingSize![i], isActive: false));
    }
    price.text = product.productPrice;
    qty.text = product.productQuantity;
    shortArabicDescripttion.text = product.productShortDescription!['ar'];
    shortEnglishDescripttion.text = product.productShortDescription!['en'];
    shortKurdishDescripttion.text = product.productShortDescription!['ku'];
    discount.text = product.offerPrice!;
    imagePath.isEmpty
        ? getImages(product.productImages!).then((cal) {
            if (mounted) {
              setState(() {});
            }
          })
        : {};
  }
}
