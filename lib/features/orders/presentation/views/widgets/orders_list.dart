import 'package:go_router/go_router.dart';
import 'package:multivendor_store/core/buttons/text_button_style.dart';
import 'package:multivendor_store/core/utils/app_route.dart';
import 'package:multivendor_store/localization/app_localization.dart';

import '../../../../../core/exports/exports.dart';

class OrdersProductsList extends StatelessWidget {
  const OrdersProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: AppAssets.products.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.all(PaddingOrFont.size10),
        height: 200.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(PaddingOrFont.size20.r),
          //color: Colors.amber,
          border: Border.all(
            color: context.colorScheme!.onBackground.withAlpha(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(PaddingOrFont.size20.spMin),
          child: Column(
            children: [
              const OrderTile(header: 'OrderID', price: '07518070601'),
              const OrderTile(header: 'Customer Name', price: 'Fawzi Gharib'),
              const OrderTile(header: 'Amount', price: '25,000 IQD'),
              const OrderTile(header: 'Quantity', price: '1x'),
              const OrderTile(header: 'Order Status', price: 'Pending'),
              const OrderTile(header: 'Payment', price: 'Pending'),
              const Spacer(),
              ActionButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRoute.kEditProduct);
                },
                label: 'View',
                color: context.colorScheme!.inversePrimary.withAlpha(100),
              ),
            ],
          ),
        ),
      ),
    );
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
        context.widthGreaterThan500 ? Size(250.w, 40.h) : Size(80.w, 30.h);
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
          fontSize: context.widthGreaterThan500
              ? PaddingOrFont.size12.spMin
              : PaddingOrFont.size12.spMin,
          color: context.colorScheme!.inverseSurface,
        ),
      ),
    );
  }
}

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.header,
    required this.price,
  });

  final String header;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          translate(key: header, context: context),
          style: context.regular!.copyWith(
            fontSize: PaddingOrFont.size14.spMin,
            color: context.colorScheme!.onBackground.withAlpha(100),
          ),
        ),
        const Text(' : '),
        Text(
          price,
          style: context.semiBold!.copyWith(
            fontSize: PaddingOrFont.size14.spMin,
            color: header == translate(key: 'Order Status', context: context) ||
                    header == translate(key: 'Payment', context: context)
                ? Colors.red
                : context.colorScheme!.onBackground,
          ),
        ),
      ],
    );
  }
}
