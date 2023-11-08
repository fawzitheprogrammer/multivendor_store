import 'package:multivendor_store/core/exports/exports.dart';

Widget loginAndRegistrationLabel(
    {required Text text, required isKeyBoardOpen}) {
  return AnimatedSwitcher(
    duration: const Duration(milliseconds: 300),
    child: isKeyBoardOpen
        ? Container()
        : Padding(
            padding: EdgeInsets.symmetric(
              horizontal: PaddingOrFont.size18.w,
              vertical: PaddingOrFont.size18.w,
            ),
            child: Align(
              alignment: sharedPreferences!.getString('lang') == 'en'
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: text,
            ),
          ),
  );
}
