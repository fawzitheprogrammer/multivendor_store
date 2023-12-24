import 'package:multivendor_store/core/exports/exports.dart';

class AnimatedVector extends StatelessWidget {
  const AnimatedVector({
    super.key,
    required this.child,
    required this.isKeyboardOpen,
  });

  final dynamic child;
  final bool isKeyboardOpen;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: child,
        );
      },
      duration: const Duration(milliseconds: 500),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: isKeyboardOpen
          ? Container()
          : child is String
              ? Center(child: SvgPicture.asset(child))
              : child,
    );
  }
}
