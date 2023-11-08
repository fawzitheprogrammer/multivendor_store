import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multivendor_store/core/buttons/rounded_button_style.dart';
import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/core/utils/app_route.dart';
import 'package:multivendor_store/localization/app_localization.dart';
import 'package:multivendor_store/manager/theme_bloc/theme_state.dart';

import '../../../../manager/language_bloc/language_localization_bloc.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: UserProfileViewBody(),
          ),
        ),
      ),
    );
  }
}

class UserProfileViewBody extends StatefulWidget {
  const UserProfileViewBody({super.key});

  @override
  State<UserProfileViewBody> createState() => _UserProfileViewBodyState();
}

class _UserProfileViewBodyState extends State<UserProfileViewBody> {
  void _changeLanguage(language) {
    BlocProvider.of<LanguageLocalizationBloc>(context).add(language);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: PaddingOrFont.size30.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: const AssetImage(
              AppAssets.user,
            ),
            radius: PaddingOrFont.size30.r * 2,
          ),
          Text(
            'Fawzi Gharib',
            style: context.semiBold!.copyWith(
              fontSize: PaddingOrFont.size24.spMax,
              color: context.colorScheme!.onBackground,
            ),
          ),
          SizedBox(
            height: PaddingOrFont.size8.h - 4,
          ),
          Text(
            'fawz11gharib@gmail.com',
            style: context.regular!.copyWith(
              fontSize: PaddingOrFont.size12.spMax,
              color: context.colorScheme!.onBackground,
            ),
          ),
          SizedBox(
            height: PaddingOrFont.size14.h,
          ),
          ProfileCustomButton(
            icon: AppAssets.settings,
            label: 'Edit Profile',
            onTap: () {},
          ),
          ProfileCustomButton(
            icon: AppAssets.mode,
            label: 'Dark Mode',
            onTap: () {},
            hasSwitch: true,
          ),
          ProfileCustomButton(
            icon: AppAssets.lang,
            label: 'Language',
            onTap: () {
              showDialog<void>(
                context: context,
                barrierDismissible: true, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: context.colorScheme!.primaryContainer,
                    content: Container(
                      alignment: Alignment.center,
                      height: context.widthGreaterThan500 ? 200.h : 400.h,
                      width: context.widthGreaterThan500 ? 200.w : 400.w,
                      child: SingleChildScrollView(
                        child: ListBody(
                          children: [
                            LanguageButton(
                              language: 'English',
                              onTap: () {
                                _changeLanguage(EnglishLanguage());
                              },
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            LanguageButton(
                              language: 'عربی',
                              onTap: () {
                                _changeLanguage(ArabicLanguage());
                              },
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            LanguageButton(
                              language: 'كوردی',
                              onTap: () {
                                _changeLanguage(KurdishLanugage());
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    // actions: <Widget>[
                    //   TextButton(
                    //     child: const Text('Approve'),
                    //     onPressed: () {
                    //
                    //     },
                    //   ),
                    // ],
                  );
                },
              );
            },
            hasSwitch: false,
            hasLanguage: true,
          ),
          ProfileCustomButton(
            icon: AppAssets.userOrder,
            label: 'My Orders',
            onTap: () {},
          ),
          ProfileCustomButton(
            icon: AppAssets.logOut,
            label: 'Log out',
            onTap: () {
              GoRouter.of(context).push(AppRoute.kLoginView);
            },
          )
        ],
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
    required this.language,
    this.onTap,
  });

  final String language;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: roundedButtonStyle,
      onPressed: onTap,
      child: Text(
        language,
        style: context.semiBold!.copyWith(
          fontSize: context.widthGreaterThan500
              ? PaddingOrFont.size16.spMin
              : PaddingOrFont.size26.spMin,
          fontFamily: 'NRT-Reg',
        ),
      ),
    );
  }
}

class ProfileCustomButton extends StatelessWidget {
  const ProfileCustomButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.hasSwitch = false,
    this.hasLanguage = false,
  });

  final String icon;
  final String label;
  final void Function()? onTap;
  final bool hasSwitch;
  final bool hasLanguage;

  @override
  Widget build(BuildContext context) {
    String getLanguage() {
      String lang = context.languageCode;
      if (lang == 'en') {
        return 'English';
      } else if (lang == 'ar') {
        return 'عربی';
      } else if (lang == 'ku') {
        return 'كوردی';
      } else {
        return 'English';
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.widthGreaterThan500 ? 60.h : 120.h,
        padding: EdgeInsets.all(PaddingOrFont.size10.w),
        margin: EdgeInsets.symmetric(
          horizontal: context.widthGreaterThan500
              ? PaddingOrFont.size24.w
              : PaddingOrFont.size30.h * 2,
          vertical: PaddingOrFont.size8.h - 4,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: context.colorScheme!.onBackground.withAlpha(30),
        ),
        child: Row(
          children: [
            SizedBox(
              width: PaddingOrFont.size14.w,
            ),
            SvgPicture.asset(
              icon,
              width: context.widthGreaterThan500
                  ? PaddingOrFont.size20.w
                  : PaddingOrFont.size30.w,
              color: label != 'Log out'
                  ? context.colorScheme!.onBackground
                  : context.colorScheme!.error,
            ),
            SizedBox(
              width: PaddingOrFont.size8.w,
            ),
            Text(
              translate(key: label, context: context),
              style: context.regular!.copyWith(
                fontSize: context.widthGreaterThan500
                    ? PaddingOrFont.size14.spMin
                    : PaddingOrFont.size22.spMin,
                color: label != 'Log out'
                    ? context.colorScheme!.onBackground
                    : context.colorScheme!.error,
              ),
            ),
            const Spacer(),
            hasLanguage == true
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: PaddingOrFont.size12.w,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: ColoredBox(
                        color: context.colorScheme!.onBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            getLanguage(),
                            style: context.semiBold!.copyWith(
                              color: context.colorScheme!.background,
                              fontSize: context.widthGreaterThan500
                                  ? PaddingOrFont.size12.spMax
                                  : PaddingOrFont.size24.spMax,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            hasSwitch == true
                ? BlocBuilder<ThemeModeCubit, bool>(
                    builder: (context, state) => Switch.adaptive(
                      value: state,
                      onChanged: (v) {
                        BlocProvider.of<ThemeModeCubit>(context)
                            .toggleTheme(value: v);
                      },
                      thumbColor: MaterialStatePropertyAll(
                        context.colorScheme!.onBackground,
                      ),
                      activeTrackColor:
                          context.colorScheme!.onBackground.withAlpha(40),
                      inactiveThumbColor:
                          context.colorScheme!.onBackground.withAlpha(120),
                      inactiveTrackColor:
                          context.colorScheme!.onBackground.withAlpha(120),
                      splashRadius: 20.r,
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
