import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivendor_store/core/animated_image_sizer.dart';
import 'package:multivendor_store/core/build_context_extension.dart';
import 'package:multivendor_store/core/buttons/text_button_style.dart';
import 'package:multivendor_store/core/check_if_user_is_connected.dart';
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
import 'package:multivendor_store/features/product_edit/presentation/views/widgets/category_drop_down.dart';
import 'package:multivendor_store/features/product_edit/presentation/views/widgets/product_image.dart';
import 'package:multivendor_store/features/store-profile/data/models/product_model.dart';
import 'package:multivendor_store/localization/app_localization.dart';
import 'package:multivendor_store/manager/cubit/category_drop_down_cubit.dart';
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
  String? selectedCategory, selectedSubcategory, brand;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCategory = AppAssets.categoriesAndSubcategory.keys.first;
    selectedSubcategory =
        AppAssets.categoriesAndSubcategory[selectedCategory]!.first;
  }

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocConsumer<StoreProductBloc, StoreProductState>(
          builder: (context, state) {
            if (state is SingleProductState) {
              if (state.product != null) {
                isCreateProduct = false;

                // getImages(state.product!.productImages!).whenComplete(() {
                //   if (mounted) {
                //     setState(() {});
                //   }
                // });

                productNameEnglish.text = state.product!.productName!['en'];
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
                          height: PaddingOrFont.size24.h,
                        ),
                        ProductImage(
                          onTap: () async {
                            if (mounted) {
                              imagePath = await pickMultiImage();
                              setState(() {});
                            }
                          },
                          imagePath: imagePath,
                        ),
                        SizedBox(
                          height: PaddingOrFont.size24.spMin - 4,
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
                              width: PaddingOrFont.size24.spMin - 5,
                            ),
                            Expanded(
                              child: CustomTextFieldWidget(
                                controller: productNameArabic,
                                label: 'Product Name Arabic',
                                validator: (val) {
                                  return checkEmptyFields(
                                    controller: productNameArabic,
                                    val: val!,
                                    locale: 'ar',
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: PaddingOrFont.size24.spMin - 5,
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
                          ],
                        ),
                        SizedBox(
                          height: PaddingOrFont.size24.spMin,
                        ),
                        CategoryDropDown(selectedCategory: selectedCategory),
                        CategoryDropDown(selectedCategory: selectedCategory),
                        // SizedBox(
                        //   height: PaddingOrFont.size24.spMin,
                        // ),
                        // Container(
                        //   constraints: BoxConstraints(maxHeight: 50.h),
                        //   decoration: BoxDecoration(
                        //     color: context.colorScheme!.onPrimary,
                        //     border: Border.all(
                        //       width: 1.5.w,
                        //       color:
                        //           context.colorScheme!.primary.withAlpha(30),
                        //     ),
                        //     borderRadius: BorderRadius.circular(4.r),
                        //   ),
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: PaddingOrFont.size24.w),
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //         child: DropdownButton(
                        //           underline: Container(),
                        //           isExpanded: true,
                        //           hint: const Text('Sub Category'),
                        //           value: selectedSubcategory,
                        //           onChanged: (newValue) {
                        //             if (mounted) {
                        //               setState(() {
                        //                 selectedSubcategory = newValue!;
                        //               });
                        //             } else {
                        //               return;
                        //             }
                        //           },
                        //           items: AppAssets.categoriesAndSubcategory[
                        //                   selectedCategory]!
                        //               .map<DropdownMenuItem<String>>(
                        //                   (String value) {
                        //             return DropdownMenuItem<String>(
                        //               value: value,
                        //               child: Text(value),
                        //             );
                        //           }).toList(),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: PaddingOrFont.size24.h,
                        // ),
                        // if (selectedCategory ==
                        //         AppAssets.categoriesMap.keys.elementAt(0) ||
                        //     selectedCategory ==
                        //         AppAssets.categoriesMap.keys.elementAt(1) ||
                        //     selectedCategory ==
                        //         AppAssets.categoriesMap.keys.elementAt(2))
                        //   Row(
                        //     children:
                        //         List.generate(clothingSize.length, (index) {
                        //       return GestureDetector(
                        //         onTap: () {
                        //           if (mounted) {
                        //             setState(() {
                        //               if (selectedClothingSize
                        //                   .contains(clothingSize[index])) {
                        //                 selectedClothingSize
                        //                     .remove(clothingSize[index]);
                        //               } else {
                        //                 selectedClothingSize
                        //                     .add(clothingSize[index]);
                        //               }
                        //             });
                        //           }
                        //         },
                        //         child: WordBasedWidthContainer(
                        //           text: clothingSize[index].title,
                        //           isActive: selectedClothingSize
                        //               .contains(clothingSize[index]),
                        //         ),
                        //       );
                        //     }),
                        //   )
                        // else
                        //   const SizedBox(),
                        // // SizedBox(
                        // //   height: PaddingOrFont.size18.spMin,
                        // // ),
                        // if (selectedCategory ==
                        //     AppAssets.categoriesMap.keys.elementAt(4))
                        //   SizedBox(
                        //     height: 60.spMin,
                        //     width: double.infinity,
                        //     child: ListView(
                        //       scrollDirection: Axis.horizontal,
                        //       children:
                        //           List.generate(shoeSizes().length, (index) {
                        //         return GestureDetector(
                        //           onTap: () {
                        //             if (mounted) {
                        //               setState(() {
                        //                 if (selectedShoeSizes.contains(
                        //                     shoeSizes()[index].toString())) {
                        //                   selectedShoeSizes.remove(
                        //                       shoeSizes()[index].toString());
                        //                 } else {
                        //                   selectedShoeSizes.add(
                        //                       shoeSizes()[index].toString());
                        //                 }
                        //               });
                        //             }
                        //           },
                        //           child: WordBasedWidthContainer(
                        //             text: shoeSizes()
                        //                 .elementAt(index)
                        //                 .toString(),
                        //             isActive: selectedShoeSizes
                        //                 .contains(shoeSizes()[index]),
                        //           ),
                        //         );
                        //       }),
                        //     ),
                        //   )
                        // else
                        //   const SizedBox(),
                        // selectedCategory ==
                        //             AppAssets.categoriesMap.keys
                        //                 .elementAt(4) ||
                        //         selectedCategory ==
                        //             AppAssets.categoriesMap.keys
                        //                 .elementAt(0) ||
                        //         selectedCategory ==
                        //             AppAssets.categoriesMap.keys
                        //                 .elementAt(1) ||
                        //         selectedCategory ==
                        //             AppAssets.categoriesMap.keys.elementAt(2)
                        //     ? SizedBox(
                        //         height: PaddingOrFont.size18.spMin,
                        //       )
                        //     : const SizedBox(),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: context.colorScheme!.onPrimary,
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(6.0),
                        //     child: Autocomplete<String>(
                        //       optionsBuilder:
                        //           (TextEditingValue textEditingValue) {
                        //         if (textEditingValue.text.isEmpty) {
                        //           return const Iterable<String>.empty();
                        //         } else {
                        //           return AppAssets.allBrands
                        //               .where((String option) {
                        //             return option.toLowerCase().contains(
                        //                 textEditingValue.text.toLowerCase());
                        //           });
                        //         }
                        //       },
                        //       optionsViewBuilder:
                        //           (context, onSelected, options) {
                        //         return Align(
                        //           alignment: Alignment.topLeft,
                        //           child: Material(
                        //             elevation: 4.0,
                        //             child: SizedBox(
                        //               width: 300,
                        //               child: ListView.builder(
                        //                 padding: const EdgeInsets.all(10.0),
                        //                 itemCount: options.length,
                        //                 itemBuilder: (BuildContext context,
                        //                     int index) {
                        //                   final String option =
                        //                       options.elementAt(index);

                        //                   return GestureDetector(
                        //                     onTap: () {
                        //                       if (mounted) {
                        //                         onSelected(option);
                        //                         brand = option;
                        //                         setState(() {});
                        //                       }
                        //                     },
                        //                     child: ListTile(
                        //                       title: Text(option),
                        //                     ),
                        //                   );
                        //                 },
                        //               ),
                        //             ),
                        //           ),
                        //         );
                        //       },
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: PaddingOrFont.size18.spMin,
                        // ),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: CustomTextFieldWidget(
                        //         controller: price,
                        //         label: 'Price',
                        //         validator: (val) {
                        //           return checkFiledsWithDigitType(
                        //               controller: price, val: val!);
                        //         },
                        //         textInputType: TextInputType.number,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: PaddingOrFont.size24.h,
                        //     ),
                        //     Expanded(
                        //       child: CustomTextFieldWidget(
                        //         controller: qty,
                        //         label: 'Quantity',
                        //         validator: (val) {
                        //           return checkFiledsWithDigitType(
                        //               controller: qty, val: val ?? '0');
                        //         },
                        //         textInputType: TextInputType.number,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: PaddingOrFont.size24.h,
                        // ),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: CustomTextFieldWidget(
                        //         controller: shortKurdishDescripttion,
                        //         isMultiLine: true,
                        //         label: 'ShortDescription_Kurdish',
                        //         validator: (val) {
                        //           return checkEmptyFields(
                        //             val: val ?? '',
                        //             controller: shortKurdishDescripttion,
                        //             locale: 'ku',
                        //           );
                        //         },
                        //         textInputType: TextInputType.text,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: PaddingOrFont.size24.spMin - 5,
                        //     ),
                        //     Expanded(
                        //       child: CustomTextFieldWidget(
                        //         controller: shortArabicDescripttion,
                        //         isMultiLine: true,
                        //         label: 'ShortDescription_Arabic',
                        //         validator: (val) {
                        //           return checkEmptyFields(
                        //             val: val ?? '',
                        //             controller: shortArabicDescripttion,
                        //             locale: 'ar',
                        //           );
                        //         },
                        //         textInputType: TextInputType.text,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: PaddingOrFont.size24.spMin - 5,
                        //     ),
                        //     Expanded(
                        //       child: CustomTextFieldWidget(
                        //         controller: shortEnglishDescripttion,
                        //         isMultiLine: true,
                        //         label: 'ShortDescription_English',
                        //         validator: (val) {
                        //           return checkEmptyFields(
                        //             val: val ?? '',
                        //             controller: shortEnglishDescripttion,
                        //             locale: 'en',
                        //           );
                        //         },
                        //         textInputType: TextInputType.text,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: PaddingOrFont.size24.h,
                        // ),
                        // CustomTextFieldWidget(
                        //   controller: discount,
                        //   label: 'Offer Price',
                        //   validator: (val) {
                        //     return checkFiledsWithDigitType(
                        //         controller: discount, val: val!);
                        //   },
                        //   textInputType: TextInputType.number,
                        // ),
                        // SizedBox(
                        //   height: PaddingOrFont.size16.h,
                        // ),
                        TextButton(
                          style: textButtonStyle.copyWith(
                            backgroundColor: MaterialStatePropertyAll(
                              context.colorScheme!.onBackground,
                            ),
                          ),
                          onPressed: () {
                            print(productNameEnglish.text);
                            // print(selectedSubcategory);
                            // print(selectedSubcategory);
                            // print(selectedSubcategory);
                            // print(selectedSubcategory);
                            // print(selectedSubcategory);
                            // if (state.product != null) {
                            //   storeData(productState: state.product);
                            // } else {
                            //   storeData();
                            // }
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
    );
  }

  void storeData({Product? productState}) {
    checkInternetAccess().then((value) {
      if (value) {
        if (_formKey.currentState!.validate() && imagePath.isNotEmpty) {
          Product product = Product(
            productId: '',
            productName: {
              "ku": productNameKurdish.text,
              "en": productNameEnglish.text,
              "ar": productNameArabic.text,
            },
            productCategory: selectedCategory ?? 'Uncategorized',
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
            brandName: brand ?? 'None',
            vendorName: firebaseUser!.toString(),
            tags: [],
            clothingSize: getClothesSize(selectedClothingSize),
            shoeSize: selectedShoeSizes,
            productSubCategory: selectedSubcategory,
          );

          if (isCreateProduct == true) {
            BlocProvider.of<StoreProductBloc>(context).add(
              CreateProduct(
                product: product,
                file: imagePath,
                context: context,
              ),
            );
          } else {
            BlocProvider.of<StoreProductBloc>(context).add(
              UpdateProduct(
                productID: productState!.productId,
                product: product,
                file: imagePath,
                context: context,
              ),
            );
          }
        } else {
          notification('Failure',
              translate(key: 'required fields', context: context), context);
        }
      } else {
        notification('Failure', translate(key: 'No internet', context: context),
            context);
      }
    });
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
}
