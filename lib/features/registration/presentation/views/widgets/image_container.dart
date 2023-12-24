import 'package:image_picker/image_picker.dart';

import '../../../../../core/exports/exports.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.boxBorder,
    this.image,
    required this.label,
    required this.iconData,
    required this.isErrorBordere,
  });

  final XFile? image;
  final String label;
  final Border boxBorder;
  final String iconData;
  final bool isErrorBordere;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.isWidthLessThan500
          ? PaddingOrFont.size10.spMin * 5
          : PaddingOrFont.size10.spMin * 6,
      decoration: BoxDecoration(
          color: context.colorScheme!.onPrimary,
          borderRadius: BorderRadius.circular(PaddingOrFont.size10.r - 6),
          border: Border.all(
            color: isErrorBordere == false
                ? context.colorScheme!.onBackground.withAlpha(40)
                : Colors.redAccent,
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: PaddingOrFont.size14.spMin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                image == null ? label : image?.name ?? '',
                style: context.medium!.copyWith(
                  fontSize: PaddingOrFont.size14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SvgPicture.asset(
              iconData,
              color: Colors.white,
              width: PaddingOrFont.size12 * 2,
            )
          ],
        ),
      ),
    );
  }
}
