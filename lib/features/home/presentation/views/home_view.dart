import 'package:multivendor_store/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:multivendor_store/features/orders/presentation/views/orders_profile_view.dart';
import 'package:multivendor_store/features/store-profile/presentation/views/store_profile_view.dart';
import 'package:multivendor_store/features/user-profile/presentation/views/user_profile_view.dart';

import '../../../../core/exports/exports.dart';
import '../../../../localization/app_localization.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  List<Widget> pages = [
    const HomeViewBody(),
    const StoreProfileView(),
    const OrdersProfileView(),
    const UserProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = context.regular!.copyWith(
      fontSize: context.widthGreaterThan500
          ? PaddingOrFont.size10.spMax
          : PaddingOrFont.size16.spMax,
      inherit: true,
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: pages[_currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: context.colorScheme!.background,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex =
                index; // Change the current page when a tab is tapped
          });
        },
        selectedLabelStyle: labelStyle,
        unselectedLabelStyle: labelStyle,
        selectedItemColor: context.colorScheme!.tertiary,
        type: BottomNavigationBarType.fixed, // Use this for 5 or more items
        items: [
          BottomNavigationBarItem(
            icon: icon(icon: AppAssets.profit),
            label: translate(context: context, key: 'Profit'),
            activeIcon: icon(
              icon: AppAssets.profit,
              iconColor: context.colorScheme!.tertiary,
            ),
          ),
          BottomNavigationBarItem(
            icon: icon(icon: AppAssets.items),
            label: translate(context: context, key: 'Items'),
            activeIcon: icon(
              icon: AppAssets.items,
              iconColor: context.colorScheme!.tertiary,
            ),
          ),
          BottomNavigationBarItem(
            icon: icon(icon: AppAssets.orders),
            label: translate(context: context, key: 'Orders'),
            activeIcon: icon(
              icon: AppAssets.orders,
              iconColor: context.colorScheme!.tertiary,
            ),
          ),
          BottomNavigationBarItem(
            icon: icon(icon: AppAssets.accountCircleBold),
            label: translate(context: context, key: 'Profile'),
            activeIcon: icon(
              icon: AppAssets.accountCircleBold,
              iconColor: context.colorScheme!.tertiary,
            ),
          ),
        ],
      ),
    );
  }

  Widget icon({required String icon, Color? iconColor}) {
    // Icon Size
    double iconSize = context.widthGreaterThan500
        ? PaddingOrFont.size22.spMin
        : PaddingOrFont.size30.spMin;

    return Padding(
      padding: const EdgeInsets.all(PaddingOrFont.size10),
      child: SvgPicture.asset(
        icon,
        width: iconSize,
        color: iconColor ?? Colors.grey,
      ),
    );
  }
}
