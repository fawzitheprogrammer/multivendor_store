import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/localization/app_localization.dart';
import 'package:multivendor_store/manager/cubit/category_drop_down_cubit.dart';

class CategoryDropDown extends StatelessWidget {
  CategoryDropDown({
    super.key,
    required this.selectedCategory,
  });

  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDropDownCubit, String?>(
      builder: (context, state) {
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
                  value: state,
                  onChanged: (newValue) {
                    BlocProvider.of<CategoryDropDownCubit>(context)
                        .selectCategory(newValue);
                  },
                  items: List.generate(
                    AppAssets.categoriesMap.keys.length,
                    (index) => DropdownMenuItem(
                      value: AppAssets.categoriesMap.keys.elementAt(index),
                      child: Text(
                        translate(
                          key: AppAssets.categoriesMap.keys.elementAt(index),
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
        );
      },
    );
  }
}
