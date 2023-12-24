import '../../../../../core/exports/exports.dart';

class CustomDropDownList extends StatefulWidget {
  const CustomDropDownList({
    super.key,
    required this.boxBorder,
    required this.label,
    required this.theList,
    required this.dropDownValue,
    this.onChanged,
    required this.isErrorBordere,
  });

  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();

  final Border boxBorder;
  final String label;
  final List<String> theList;
  final String? dropDownValue;
  final void Function(String?)? onChanged;
  final bool isErrorBordere;
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: context.isWidthLessThan500
          ? PaddingOrFont.size10.spMin * 5
          : PaddingOrFont.size10.spMin * 6,
      decoration: BoxDecoration(
        color: context.colorScheme!.onPrimary,
        borderRadius: BorderRadius.circular(PaddingOrFont.size10.r - 6),
        border: Border.all(
          color: widget.isErrorBordere == false
              ? context.colorScheme!.onBackground.withAlpha(40)
              : Colors.red,
        ),
      ),
      child: DropdownButton(
        underline: const SizedBox(),
        isExpanded: true,
        value: widget.dropDownValue,
        hint: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PaddingOrFont.size10.spMin,
          ),
          child: Text(
            widget.label,
            style:
                context.medium!.copyWith(fontSize: PaddingOrFont.size14.spMin),
          ),
        ),
        items: widget.theList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: PaddingOrFont.size10.spMin,
              ),
              child: Text(value),
            ),
          );
        }).toList(),
        onChanged: widget.onChanged,
      ),
    );
  }
}
