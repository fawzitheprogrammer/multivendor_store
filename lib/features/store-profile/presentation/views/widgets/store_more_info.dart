import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/localization/app_localization.dart';

class StoreMoreInformation extends StatelessWidget {
  const StoreMoreInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: StoreMoreInfoViewBody(),
        ),
      ),
    );
  }
}

class StoreMoreInfoViewBody extends StatelessWidget {
  const StoreMoreInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(PaddingOrFont.size24.w),
            child: Row(
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
          ),
          const StoreInfoTile(
            header: 'Shop Area',
            iconPath: AppAssets.location,
            value: 'Newroz',
          ),
          const StoreInfoTile(
            header: 'Opening hours',
            iconPath: AppAssets.clock,
            value: '9:00 AM - 7:00 PM',
          ),
          const StoreInfoTile(
            header: 'Delivery time',
            iconPath: AppAssets.deliveryTime,
            value: '1-3 days',
          ),
          const StoreInfoTile(
            header: 'Minimum order',
            iconPath: AppAssets.minimumOrder,
            value: '5,000 IQD',
          ),
          const StoreInfoTile(
            header: 'Delivery fee',
            iconPath: AppAssets.deliveryFee,
            value: '1,000 IQD',
          ),
          const StoreInfoTile(
            header: 'Accepted Payment',
            iconPath: AppAssets.paymentMethod,
            value: 'Cash',
          )
        ],
      ),
    );
  }
}

class StoreInfoTile extends StatelessWidget {
  const StoreInfoTile({
    super.key,
    required this.header,
    required this.iconPath,
    required this.value,
  });

  final String header;
  final String iconPath;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: PaddingOrFont.size24.w,
        vertical: PaddingOrFont.size10.h - 8,
      ),
      child: Column(
        children: [
          const Divider(
            thickness: 1,
          ),
          // const SizedBox(
          //   height: PaddingOrFont.size14,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      iconPath,
                      width: PaddingOrFont.size16.w,
                      color: context.colorScheme!.onBackground,
                    ),
                    SizedBox(
                      width: PaddingOrFont.size10.w,
                    ),
                    Text(
                      translate(key: header, context: context),
                      style: context.semiBold!.copyWith(
                        fontSize: PaddingOrFont.size14.spMax,
                      ),
                    ),
                  ],
                ),
                Text(
                  value,
                  style: context.regular!.copyWith(
                    fontSize: PaddingOrFont.size14.spMax,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
