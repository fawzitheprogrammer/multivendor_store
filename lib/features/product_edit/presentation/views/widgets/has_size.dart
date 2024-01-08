import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/localization/app_localization.dart';

class HasSize extends StatelessWidget {
  const HasSize({
    super.key,
    required this.hasSize,
  });

  final bool hasSize;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        translate(key: 'Has Size', context: context),
        style: context.medium,
      ),
      subtitle: Text(
        translate(key: 'Size Instruction', context: context),
        style: context.regular?.copyWith(fontSize: PaddingOrFont.size12.spMin),
      ),
      value: hasSize,
      onChanged: (val) {},
    );
  }
}
