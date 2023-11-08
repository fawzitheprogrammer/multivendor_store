import 'package:go_router/go_router.dart';
import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/core/utils/app_route.dart';
import 'package:multivendor_store/localization/app_localization.dart';

class ChatAndWelcomeText extends StatelessWidget {
  const ChatAndWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${translate(context: context, key: 'Welcome')}!🖐',
              style: context.semiBold!.copyWith(
                fontSize: context.widthGreaterThan500
                    ? PaddingOrFont.size14.spMin
                    : PaddingOrFont.size26.spMin,
              ),
            ),
            Text(
              'Fawzi Gharib',
              style: context.semiBold!.copyWith(
                fontSize: context.widthGreaterThan500
                    ? PaddingOrFont.size20.spMin
                    : PaddingOrFont.size30.spMin + 10,
                color: context.colorScheme!.tertiary,
              ),
            )
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRoute.kAllChatScreen);
          },
          child: SizedBox(
            child: Stack(
              alignment: sharedPreferences!.getString('lang') == 'en'
                  ? Alignment.topRight
                  : Alignment.topLeft,
              children: [
                CircleAvatar(
                  backgroundColor:
                      context.colorScheme!.onBackground.withAlpha(20),
                  radius: context.widthGreaterThan500
                      ? PaddingOrFont.size20.spMin
                      : PaddingOrFont.size30.spMin + 5,
                  child: SvgPicture.asset(
                    AppAssets.messenger,
                    color: context.colorScheme!.onBackground,
                    width: context.widthGreaterThan500
                        ? PaddingOrFont.size26.spMin
                        : PaddingOrFont.size30.spMin + 20,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: context.widthGreaterThan500
                      ? PaddingOrFont.size10.spMin - 2
                      : PaddingOrFont.size12.spMin,
                  child: Text(
                    '2',
                    style: context.regular!.copyWith(
                        fontSize: context.widthGreaterThan500
                            ? PaddingOrFont.size10.spMin
                            : PaddingOrFont.size12.spMin,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
