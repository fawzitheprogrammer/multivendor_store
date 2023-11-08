import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/localization/app_localization.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.widthGreaterThan500 ? 100.h : 200.h,
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingOrFont.size20,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme!.primary,
        borderRadius: BorderRadius.circular(PaddingOrFont.size10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.totalProfit,
            width: context.widthGreaterThan500
                ? PaddingOrFont.size30.w
                : PaddingOrFont.size30 * 1.75,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: PaddingOrFont.size10.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  translate(key: 'Total Profit', context: context),
                  style: context.regular!.copyWith(
                      color: Colors.white,
                      fontSize: context.widthGreaterThan500
                          ? PaddingOrFont.size14.spMin
                          : PaddingOrFont.size30.spMin),
                ),
                Text(
                  '280,000 IQD',
                  style: context.semiBold!.copyWith(
                    color: Colors.white,
                    fontSize: context.widthGreaterThan500
                        ? PaddingOrFont.size24.spMin
                        : PaddingOrFont.size30.spMin + 20,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
