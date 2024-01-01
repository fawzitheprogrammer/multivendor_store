import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multivendor_store/core/buttons/text_button_style.dart';
import 'package:multivendor_store/core/utils/app_route.dart';
import 'package:multivendor_store/features/store-profile/data/models/product_model.dart';
import 'package:multivendor_store/localization/app_localization.dart';
import 'package:multivendor_store/manager/store-product/store_product_bloc.dart';

import '../../../../../core/exports/exports.dart';

class StoreProductsList extends StatelessWidget {
  const StoreProductsList({
    super.key,
    required this.product,
  });

  final List<Product> product;

  @override
  Widget build(BuildContext context) {
    if (product.isNotEmpty) {
      return SliverList.builder(
        itemCount: product.length,
        itemBuilder: (context, index) => SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(PaddingOrFont.size10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(PaddingOrFont.size20.r),
              //color: Colors.amber,
              border: Border.all(
                color: context.colorScheme!.onBackground.withAlpha(20),
              ),
            ),
            child: Row(
              children: [
                // const SizedBox(
                //   width: PaddingOrFont.size10,
                // ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(PaddingOrFont.size10.spMin),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(PaddingOrFont.size10.r),
                      child: SizedBox(
                        height:
                            context.isWidthLessThan500 ? 100.spMin : 150.spMin,
                        child: Image.network(
                          product[index].productImages!.first,
                          width: context.isWidthLessThan500
                              ? 100.spMin
                              : 200.spMin,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: PaddingOrFont.size12.spMin - 6,
                    vertical: PaddingOrFont.size18.spMin,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product[index].productName!['ku'] ?? '',
                        style: context.bold!.copyWith(
                          fontSize: context.isWidthLessThan500
                              ? PaddingOrFont.size18.spMin
                              : PaddingOrFont.size14.h,
                        ),
                      ),
                      SizedBox(
                        height: PaddingOrFont.size10.h - 2,
                      ),
                      Text(
                        r'$160.00',
                        style: context.semiBold!.copyWith(
                          fontSize: PaddingOrFont.size16.spMax,
                          color: context.colorScheme!.error,
                        ),
                      ),
                      SizedBox(
                        height: PaddingOrFont.size8.h - 2,
                      ),
                      Row(
                        children: [
                          ActionButton(
                            onPressed: () {
                              //
                              BlocProvider.of<StoreProductBloc>(context).add(
                                GetSingleProduct(product: product[index]),
                              );
                              GoRouter.of(context).push(
                                  AppRoute.kAddOrEditProduct,
                                  extra: product[index]);
                            },
                            label: 'Edit',
                            color: context.colorScheme!.inversePrimary
                                .withAlpha(30),
                          ),
                          SizedBox(
                            width: PaddingOrFont.size10.w - 6,
                          ),
                          ActionButton(
                            onPressed: () {
                              BlocProvider.of<StoreProductBloc>(context).add(
                                DeleteProduct(
                                    productID: product[index].productId),
                              );
                            },
                            label: 'Delete',
                            color: context.colorScheme!.error.withAlpha(30),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return SliverFillRemaining(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_box_rounded,
              size: context.isWidthLessThan500 ? 40.spMin : 50.spMin,
              color: context.colorScheme!.onBackground,
            ),
            Text(
              translate(key: 'You have no items yet', context: context),
              style: context.bold,
            ),
            Text(
              translate(
                  key: 'Tap + button to start adding item.', context: context),
              style: context.medium,
            ),
          ],
        ),
      );
    }
  }
}

class ActionButton extends StatefulWidget {
  const ActionButton({
    super.key,
    required this.label,
    this.onPressed,
    this.color,
  });

  final String label;
  final void Function()? onPressed;
  final Color? color;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    Size buttonSize =
        context.isWidthLessThan500 ? Size(80.w, 30.h) : Size(80.w, 30.h);
    return TextButton(
      style: textButtonStyle.copyWith(
        backgroundColor: MaterialStatePropertyAll(widget.color),
        maximumSize: MaterialStatePropertyAll(
          buttonSize,
        ),
        minimumSize: MaterialStatePropertyAll(
          buttonSize,
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(
        translate(key: widget.label, context: context),
        style: context.regular!.copyWith(
          fontSize: context.isWidthLessThan500
              ? PaddingOrFont.size12.spMin
              : PaddingOrFont.size12.spMin,
          color: widget.label == 'Edit'
              ? context.colorScheme!.inverseSurface
              : widget.color!.withAlpha(220),
        ),
      ),
    );
  }
}
