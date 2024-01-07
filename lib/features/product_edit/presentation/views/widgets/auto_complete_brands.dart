import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/manager/brand-cubit/brand_cubit.dart';

class AutoCompleteBrands extends StatelessWidget {
  const AutoCompleteBrands({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: BlocBuilder<BrandCubit, String?>(
        builder: (context, brand) => Autocomplete<String>(
          //initialValue: const TextEditingValue(text: 'Brand'),
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            } else {
              return AppAssets.allBrands.where((String option) {
                return option
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase());
              });
            }
          },
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) =>
                  TextField(
            focusNode: focusNode,
            controller: textEditingController,
            onSubmitted: (String value) {
              // Handle the submission logic here
              // For example, you can call onFieldSubmitted or any other custom method
              onFieldSubmitted();
            },
            // Other properties...
          ),
          optionsViewBuilder: (context, onSelected, options) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 4.0,
                child: SizedBox(
                  width: 300,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String option = options.elementAt(index);

                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<BrandCubit>(context).setBrand(option);
                        },
                        child: ListTile(
                          title: Text(option),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
