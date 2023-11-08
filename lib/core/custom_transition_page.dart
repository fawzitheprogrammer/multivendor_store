import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage pageTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const beginOffset = Offset(1.0, 0.0);
      const endOffset = Offset.zero;
      var curves = Curves.decelerate;

      var slideAnimation = Tween(begin: beginOffset, end: endOffset)
          .animate(CurvedAnimation(parent: animation, curve: curves));

      return Align(
        alignment: Alignment.center,
        child: SlideTransition(
          position: slideAnimation,
          child: child,
        ),
      );
    },
  );
}
