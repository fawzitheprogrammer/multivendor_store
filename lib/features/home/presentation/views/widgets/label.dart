import '../../../../../core/exports/exports.dart';

class Label extends StatelessWidget {
  const Label({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: context.semiBold!.copyWith(fontSize: PaddingOrFont.size16.spMax),
    );
  }
}
