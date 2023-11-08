import 'package:go_router/go_router.dart';

import '../../../../../core/exports/exports.dart';
import '../../../../../core/utils/app_route.dart';

class StoreProfileInformation extends StatelessWidget {
  const StoreProfileInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: PaddingOrFont.size20.w,
            vertical: PaddingOrFont.size14.w),
        child: Container(
          padding: EdgeInsets.all(PaddingOrFont.size18.w),
          decoration: BoxDecoration(
            color: context.colorScheme!.onBackground.withAlpha(20),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: context.colorScheme!.onBackground.withAlpha(40),
            ),
          ),
          height: 200.h,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 35.r,
                    backgroundImage: const AssetImage(
                      AppAssets.store,
                    ),
                  ),
                  SizedBox(
                    width: PaddingOrFont.size10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sports Central',
                            style: context.bold!.copyWith(
                              fontSize: PaddingOrFont.size22.sp,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              GoRouter.of(context).push(
                                AppRoute.kStoreMoreInfo,
                              );
                            },
                            icon: const Icon(
                              Icons.info_outline,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 2.0.h),
                            child: Icon(
                              Icons.star_rounded,
                              size: PaddingOrFont.size22.r,
                              color: Colors.amber,
                            ),
                          ),
                          Text(
                            '4.7 (234)',
                            style: context.regular!.copyWith(
                              fontSize: PaddingOrFont.size14.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: PaddingOrFont.size10 - 6,
                ),
                child: Divider(
                  thickness: 1.h,
                ),
              ),
              const Flexible(
                child: Text(
                  'Lorem ipsum dolor sit amet, consetetur sadi sspscing elitr, sed diaorem ipsum dolor sit amet, consetetur sadi sspscing elitr, sed diaorem ipsum dolor sit amet, consetetur sadi sspscing elitr, sed diam nonumy,Lorem ipsum dolor sit amet, consetetur sadi sspscing elitr, sed diam nonumy',
                  overflow: TextOverflow.fade,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
