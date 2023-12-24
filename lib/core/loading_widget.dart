import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/localization/app_localization.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.discreteCircle(
            color: context.colorScheme!.primary,
            size: PaddingOrFont.size30.spMin * 2,
          ),
          SizedBox(
            height: PaddingOrFont.size18.spMin,
          ),
          Padding(
            padding: context.languageCode != 'en'
                ? EdgeInsets.only(right: PaddingOrFont.size12.spMin)
                : EdgeInsets.only(left: PaddingOrFont.size12.spMin),
            child: Text(
              translate(key: 'Please wait...', context: context),
              style: context.medium!
                  .copyWith(fontSize: PaddingOrFont.size14.spMin),
            ),
          )
        ],
      ),
    );
  }
}
