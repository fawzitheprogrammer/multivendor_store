import 'package:multivendor_store/localization/app_localization.dart';

import '../../../../../core/exports/exports.dart';
import '../../../../../core/text_responsive.dart';

class StoreCategories extends StatefulWidget {
  const StoreCategories({super.key});

  @override
  State<StoreCategories> createState() => _StoreCategoriesState();
}

class _StoreCategoriesState extends State<StoreCategories> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: context.colorScheme!.background,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(15.h),
        child: SizedBox(
          height: 60.h,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: PaddingOrFont.size16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: PaddingOrFont.size8.h,
                //     vertical: PaddingOrFont.size10.w,
                //   ),
                //   child: Label(
                //     label: translate(key: 'Categories', context: context),
                //   ),
                // ),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      AppAssets.categoriesMap.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: WordBasedWidthContainer(
                          text: translate(
                              key: AppAssets.categoriesMap.keys.elementAt(
                                index,
                              ),
                              context: context),
                          isActive: currentIndex == index,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
