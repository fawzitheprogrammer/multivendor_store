import 'package:intl/intl.dart';
import 'package:multivendor_store/core/appbar.dart';
import 'package:multivendor_store/core/exports/exports.dart';

class AllChatsView extends StatelessWidget {
  const AllChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: const AllChatsViewBody(),
    );
  }
}

class AllChatsViewBody extends StatelessWidget {
  const AllChatsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          20,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: PaddingOrFont.size10.w),
              alignment: sharedPreferences!.getString('lang') == 'en'
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: context.isWidthLessThan500 ? 25.r : 45.r,
                    backgroundImage: const AssetImage(
                      AppAssets.user,
                    ),
                  ),
                  SizedBox(
                    width: PaddingOrFont.size10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fawzi Gharib",
                        style: context.bold!.copyWith(
                          color: context.colorScheme!.onBackground,
                          fontSize: context.isWidthLessThan500
                              ? PaddingOrFont.size14.spMin
                              : PaddingOrFont.size24.spMin,
                        ),
                      ),
                      context.languageCode == 'en'
                          ? SizedBox(
                              height: PaddingOrFont.size10.h - 4,
                            )
                          : const SizedBox(),
                      Text(
                        "Not much, just relaxing.",
                        style: context.regular!.copyWith(
                          color: context.colorScheme!.onBackground,
                          fontSize: context.isWidthLessThan500
                              ? PaddingOrFont.size12.spMin
                              : PaddingOrFont.size18.spMin,
                        ),
                      ),
                      context.languageCode == 'en'
                          ? SizedBox(
                              height: PaddingOrFont.size10.h - 4,
                            )
                          : const SizedBox(),
                      Text(
                        '${DateFormat.yMEd(context.languageCode).format(DateTime.now())} • ${DateFormat('h:mm a', context.languageCode).format(DateTime.now())}',
                        style: context.regular!.copyWith(
                          color:
                              context.colorScheme!.onBackground.withAlpha(120),
                          fontSize: context.isWidthLessThan500
                              ? PaddingOrFont.size10
                              : PaddingOrFont.size12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
