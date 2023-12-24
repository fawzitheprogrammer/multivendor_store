import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:multivendor_store/core/buttons/text_button_style.dart';
import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/core/loading_widget.dart';
import 'package:multivendor_store/core/utils/app_route.dart';
import 'package:multivendor_store/features/splash-screen/presentation/views/check_if_user_is_connected_to_internet.dart';
import 'package:multivendor_store/localization/app_localization.dart';
import 'package:multivendor_store/manager/connection-bloc/connection_bloc.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ConnectionBloc>(context).add(CheckConnection());
    return Scaffold(
      backgroundColor: context.colorScheme!.background,
      body: const SplashScreenViewBody(),
    );
  }
}

class SplashScreenViewBody extends StatelessWidget {
  const SplashScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CheckIfUserHasNetwork(
      child: BlocBuilder<ConnectionBloc, ConnectionDeviceState>(
        builder: (context, state) {
          if (state is ConnectionSuccess) {
            return const AppLogo();
          } else if (state is ConnectionLoading) {
            return state.isCheckComplete ? const NoNetWork() : const Loading();
          } else {
            return const Loading();
          }
        },
      ),
    );
  }
}

class AppLogo extends StatefulWidget {
  const AppLogo({super.key});

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    sizeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.decelerate),
    );

    controller.forward();
    Future.delayed(const Duration(seconds: 5)).then((value) => getRoute());
  }

  void getRoute() {
    if (sharedPreferences!.get('route') != null) {
      GoRouter.of(context).push(sharedPreferences!.get('route').toString());
    } else {
      GoRouter.of(context).push(AppRoute.kLoginView);
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: sizeAnimation,
            child: const Icon(
              Ionicons.cafe,
              size: 100,
            ),
          )
        ],
      ),
    );
  }
}

class NoNetWork extends StatelessWidget {
  const NoNetWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.wifi_off_rounded,
          size: context.isWidthLessThan500 ? 100.spMin : 40.spMin,
          color: context.colorScheme!.onPrimaryContainer,
        ),
        Text(
          translate(key: 'No internet', context: context),
          style: context.bold!.copyWith(fontSize: 18),
        ),
        Text(
          translate(key: 'Try steps', context: context),
          style: context.medium!.copyWith(fontSize: 16),
        ),
        SizedBox(
          height: 14.h,
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const InstructionBullet(
                content: 'Check modem',
              ),
              SizedBox(
                height: 6.h,
              ),
              const InstructionBullet(
                content: 'Check your mobile data',
              ),
              SizedBox(
                height: 6.h,
              ),
              const InstructionBullet(
                content: 'Connect to WIFI',
              ),
            ],
          ),
        ),
        SizedBox(
          height: PaddingOrFont.size14.spMin,
        ),
        TextButton(
          style: textButtonStyle.copyWith(
            backgroundColor:
                MaterialStatePropertyAll(context.colorScheme!.primary),
            minimumSize: MaterialStatePropertyAll(
              Size(200, 48.spMin),
            ),
          ),
          onPressed: () {
            BlocProvider.of<ConnectionBloc>(context).add(CheckConnection());
          },
          child: Text(
            translate(key: 'Try again', context: context),
            style: context.medium,
          ),
        ),

        //Spacer(),
        SizedBox(height: 38.h)
      ],
    );
  }
}

class InstructionBullet extends StatelessWidget {
  const InstructionBullet({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Ionicons.checkmark_circle_outline,
          color: context.colorScheme!.onPrimaryContainer,
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
          translate(key: content, context: context),
          style: context.regular!.copyWith(
            fontSize: PaddingOrFont.size14.spMin,
          ),
        ),
      ],
    );
  }
}
