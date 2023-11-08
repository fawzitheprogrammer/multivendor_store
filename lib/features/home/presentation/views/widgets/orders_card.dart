import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/localization/app_localization.dart';

class OrdersCard extends StatelessWidget {
  const OrdersCard({super.key});

  @override
  Widget build(BuildContext context) {
    double getCardSize() {
      if (context.mediaQuery.width > 500 && context.mediaQuery.width < 1000) {
        return 1.85.w;
      } else if (context.mediaQuery.width <= 430 &&
          context.mediaQuery.width >= 415) {
        return 1.00.w;
      } else {
        return 1.15.w;
      }
    }

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: AppAssets.dashBoardOrderInfo.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: getCardSize(),
        maxCrossAxisExtent: context.widthGreaterThan500 ? 200.h : 400.h,
      ),
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(4.w),
        child: Container(
          height: 20,
          decoration: BoxDecoration(
            color: context.colorScheme!.primary.withAlpha(20),
            borderRadius: BorderRadius.circular(
              PaddingOrFont.size10.r,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.dashBoardOrderInfo.values.elementAt(index),
                width: context.widthGreaterThan500
                    ? PaddingOrFont.size30.w * 1.25
                    : PaddingOrFont.size30.w * 1.95.spMin,
                color: context.colorScheme!.tertiary,
              ),
              SizedBox(
                height: context.widthGreaterThan500
                    ? PaddingOrFont.size14.h
                    : PaddingOrFont.size16.h,
              ),
              Text(
                translate(
                  key: AppAssets.dashBoardOrderInfo.keys.elementAt(index),
                  context: context,
                ),
                style: context.regular!.copyWith(
                  color: context.colorScheme!.onBackground.withAlpha(120),
                  fontSize: context.widthGreaterThan500
                      ? PaddingOrFont.size12.spMin
                      : PaddingOrFont.size24.spMin,
                ),
              ),
              SizedBox(
                height: context.widthGreaterThan500
                    ? PaddingOrFont.size14.h
                    : PaddingOrFont.size16.h,
              ),
              Text(
                '$index',
                style: context.bold!.copyWith(
                  color: context.colorScheme!.onBackground,
                  fontSize: context.widthGreaterThan500
                      ? PaddingOrFont.size16.spMin
                      : PaddingOrFont.size24.spMin,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
