import 'package:flutter/material.dart';

import 'login_vector_image.dart';

class AnimatedVector extends StatelessWidget {
  const AnimatedVector({
    super.key,
    required this.imagePath,
    required this.isKeyboardOpen,
  });

  final String imagePath;
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
          : VectorImage(
              imagePath: imagePath,
            ),
    );
  }
}
