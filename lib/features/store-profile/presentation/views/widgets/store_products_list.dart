import 'package:go_router/go_router.dart';
import 'package:multivendor_store/core/buttons/text_button_style.dart';
import 'package:multivendor_store/core/utils/app_route.dart';
import 'package:multivendor_store/localization/app_localization.dart';

import '../../../../../core/exports/exports.dart';

class StoreProductsList extends StatelessWidget {
  const StoreProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: AppAssets.products.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.all(PaddingOrFont.size10),
        height: 150.h,
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
            const SizedBox(
              width: PaddingOrFont.size10,
            ),
            Container(
              height: 130.h,
              width: 120.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.colorScheme!.onBackground.withAlpha(20),
                ),
                borderRadius: BorderRadius.circular(PaddingOrFont.size10),
                image: DecorationImage(
                  image: AssetImage(
                    AppAssets.products[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingOrFont.size12,
                vertical: PaddingOrFont.size18,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nike Free Metcon 3',
                    style: context.bold!.copyWith(
                      fontSize: context.widthGreaterThan500
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
                          GoRouter.of(context).push(AppRoute.kEditProduct);
                        },
                        label: 'Edit',
                        color:
                            context.colorScheme!.inversePrimary.withAlpha(30),
                      ),
                      SizedBox(
                        width: PaddingOrFont.size10.w - 6,
                      ),
                      ActionButton(
                        onPressed: () {},
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
        context.widthGreaterThan500 ? Size(80.w, 30.h) : Size(80.w, 30.h);
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
       translate(key:  widget.label, context: context),
        style: context.regular!.copyWith(
          fontSize: context.widthGreaterThan500
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
