import 'dart:io';

import 'package:ionicons/ionicons.dart';

import '../../../../../core/exports/exports.dart';

class ProductImage extends StatefulWidget {
  const ProductImage({super.key, required this.imagePath, this.onTap});

  final List<File?> imagePath;
  final void Function()? onTap;

  @override
  State<ProductImage> createState() => ProductImageState();
}

class ProductImageState extends State<ProductImage> {
  double imageRadius = PaddingOrFont.size30.r * 3;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme!.onPrimary,
          border: Border.all(
            color: context.colorScheme!.primary.withAlpha(30),
          ),
          borderRadius: BorderRadius.circular(14.r),
        ),
        height: context.isWidthLessThan500 ? 150.h : 250.h,
        width: double.infinity,
        child: widget.imagePath.isNotEmpty
            ? GridView.builder(
                itemCount: widget.imagePath.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(4.w),
                  child: SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: Image.file(
                      widget.imagePath[index]!,
                      fit: BoxFit.cover,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
              )
            : Center(
                child: Icon(
                  Ionicons.image,
                  color: context.colorScheme!.onBackground,
                  size: PaddingOrFont.size30.spMin * 2.5,
                ),
              ),
      ),
    );
  }

  Widget addIcon() {
    return Align(
      alignment: Alignment.bottomRight,
      child: CircleAvatar(
        radius: PaddingOrFont.size10.r * 2,
        backgroundColor: context.colorScheme!.background,
        child: Icon(
          Icons.add,
          color: context.colorScheme!.primary,
        ),
      ),
    );
  }
}
