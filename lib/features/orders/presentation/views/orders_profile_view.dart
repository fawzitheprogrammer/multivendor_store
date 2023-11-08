import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/features/orders/presentation/views/widgets/orders_categories.dart';
import 'package:multivendor_store/features/orders/presentation/views/widgets/orders_list.dart';

class OrdersProfileView extends StatelessWidget {
  const OrdersProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //appBar: appBar,
      body: SafeArea(
        child: Center(
          child: StoreProfileViewBody(),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class StoreProfileViewBody extends StatelessWidget {
  const StoreProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        //StoreProfileInformation(),
        OrdersCategories(),
        OrdersProductsList(),
      ],
    );
  }
}
