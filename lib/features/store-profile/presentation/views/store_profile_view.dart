import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/core/loading_widget.dart';
import 'package:multivendor_store/core/notification.dart';
import 'package:multivendor_store/core/utils/app_route.dart';
import 'package:multivendor_store/features/store-profile/presentation/views/widgets/store_categories.dart';
import 'package:multivendor_store/features/store-profile/presentation/views/widgets/store_products_list.dart';
import 'package:multivendor_store/manager/get-all-products/get_all_products_bloc.dart';
import 'package:multivendor_store/manager/store-product/store_product_bloc.dart';

class StoreProfileView extends StatelessWidget {
  const StoreProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> refresh() async {
      BlocProvider.of<GetAllProductsBloc>(context).add(GetProducts());
    }

    return Scaffold(
      //appBar: appBar,
      body: SafeArea(
        child: Center(
          child: RefreshIndicator(
            onRefresh: refresh,
            child: const StoreProfileViewBody(),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: PaddingOrFont.size28.spMin),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<StoreProductBloc>(context).add(
                GetSingleProduct(product: null),
              );
              GoRouter.of(context).push(AppRoute.kAddOrEditProduct);
            },
            child: const Icon(Ionicons.add),
          ),
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
    return BlocConsumer<GetAllProductsBloc, GetAllProductsState>(
      builder: (context, state) {
        if (state is GetAllProductsSuccess) {
          return CustomScrollView(
            slivers: [
              //StoreProfileInformation(),
              //const StoreCategories(),
              StoreProductsList(
                product: state.products,
              ),
            ],
          );
        } else {
          return const Loading();
        }
      },
      listener: (BuildContext context, GetAllProductsState state) {
        if (state is GetAllProductsFailure) {
          notification('Failure', state.errorMessage, context);
        }
      },
    );
  }
}
