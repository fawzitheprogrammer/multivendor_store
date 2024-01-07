import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/localization/app_localization.dart';
import 'package:multivendor_store/manager/category-dropdown-bloc/category_drop_down_cubit.dart';
import 'package:multivendor_store/manager/sub-cateogory-dropdown-bloc/sub_category_drop_down_cubit.dart';

class CategoryDropDown extends StatelessWidget {
  const CategoryDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDropDownCubit, String?>(
      builder: (context, category) {
        return Column(
          children: [
            Container(
              constraints: BoxConstraints(maxHeight: 50.h),
              decoration: BoxDecoration(
                color: context.colorScheme!.onPrimary,
                border: Border.all(
                  width: 1.5.w,
                  color: context.colorScheme!.primary.withAlpha(30),
                ),
                borderRadius: BorderRadius.circular(4.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: PaddingOrFont.size24.w),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton(
                      underline: Container(),
                      isExpanded: true,
                      hint: Text(
                        translate(
                          key: 'Category',
                          context: context,
                        ),
                      ),
                      value: category,
                      onChanged: (newValue) {
                        BlocProvider.of<CategoryDropDownCubit>(context)
                            .selectCategory(newValue ?? 'Men Wear');
                        BlocProvider.of<SubCategoryDropDownCubit>(context).emit(null);
                      },
                      items: List.generate(
                        AppAssets.categoriesAndSubcategory.keys.length,
                        (index) => DropdownMenuItem(
                          value: AppAssets.categoriesAndSubcategory.keys
                              .elementAt(index),
                          child: Text(
                            translate(
                              key: AppAssets.categoriesAndSubcategory.keys
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
              height: PaddingOrFont.size18.spMin,
            ),
            BlocBuilder<SubCategoryDropDownCubit, String?>(
                builder: (context, subCategory) {
              return Container(
                constraints: BoxConstraints(maxHeight: 50.h),
                decoration: BoxDecoration(
                  color: context.colorScheme!.onPrimary,
                  border: Border.all(
                    width: 1.5.w,
                    color: context.colorScheme!.primary.withAlpha(30),
                  ),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                padding:
                    EdgeInsets.symmetric(horizontal: PaddingOrFont.size24.w),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton(
                        underline: Container(),
                        isExpanded: true,
                        hint: Text(
                          translate(key: 'Sub Category', context: context),
                          style: context.regular,
                        ),
                        value: subCategory,
                        onChanged: (newValue) {
                          BlocProvider.of<SubCategoryDropDownCubit>(context)
                              .selectCategory(newValue);
                        },
                        items: AppAssets.categoriesAndSubcategory[category]!
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: context.regular,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              );
            })
          ],
        );
      },
    );
  }
}
