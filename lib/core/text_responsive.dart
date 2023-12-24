import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivendor_store/core/build_context_extension.dart';
import 'package:multivendor_store/core/padding_and_margin.dart';

class WordBasedWidthContainer extends StatefulWidget {
  const WordBasedWidthContainer(
      {super.key, required this.text, required this.isActive, this.onTap});

  final String text;
  final bool isActive;
  final void Function()? onTap;

  @override
  State<WordBasedWidthContainer> createState() =>
      _WordBasedWidthContainerState();
}

class _WordBasedWidthContainerState extends State<WordBasedWidthContainer> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
      fontSize: 16.0,
    ); // Customize the style as needed

    // Measure the text width
    double textWidth = measureTextWidth(widget.text, textStyle, context);

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PaddingOrFont.size8.h - 2,
            vertical: PaddingOrFont.size8.h - 2,
          ),
          child: Container(
            alignment: Alignment.center,
            width: textWidth + 16.0, // Add some padding
            decoration: BoxDecoration(
              color: widget.isActive
                  ? context.colorScheme!.primary
                  : context.colorScheme!.onBackground.withAlpha(10),
              borderRadius: BorderRadius.circular(
                8.r,
              ),
            ),
            child: Text(
              widget.text,
              style: context.semiBold!.copyWith(
                fontSize: PaddingOrFont.size14.sp,
                color: widget.isActive
                    ? Colors.white
                    : context.colorScheme!.onBackground.withAlpha(120),
              ),
            ),
          ),
        ),
      ],
    );
  }

  double measureTextWidth(String text, TextStyle style, BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style,
      ),
      textDirection: TextDirection.ltr,
    )..layout(
        maxWidth: context.mediaQuery.width,
      );

    return textPainter.width;
  }
}
