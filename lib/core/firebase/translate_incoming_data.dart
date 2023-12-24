import 'package:multivendor_store/core/exports/exports.dart';

translateValue(TextEditingController controller, String code, dynamic product) {
  controller.text = product != null ? product.productName[code] : null;
}
