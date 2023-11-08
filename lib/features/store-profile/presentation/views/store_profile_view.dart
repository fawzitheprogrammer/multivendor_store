import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/features/store-profile/presentation/views/widgets/store_categories.dart';
import 'package:multivendor_store/features/store-profile/presentation/views/widgets/store_products_list.dart';

class StoreProfileView extends StatelessWidget {
  const StoreProfileView({super.key});

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
        StoreCategories(),
        StoreProductsList(),
      ],
    );
  }
}
