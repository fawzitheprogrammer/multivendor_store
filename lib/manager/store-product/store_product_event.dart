part of 'store_product_bloc.dart';

@immutable
sealed class StoreProductEvent {}

class CreateProduct extends StoreProductEvent {
  final Product product;
  final List<File> file;
  final BuildContext context;

  CreateProduct(
      {required this.product, required this.file, required this.context});
}

class DeleteProduct extends StoreProductEvent {
  final String productID;

  DeleteProduct({required this.productID});
}

class UpdateProduct extends StoreProductEvent {
  final Product product;
  final String productID;
  final List<File>? file;
  final BuildContext context;

  UpdateProduct({
    required this.product,
    required this.file,
    required this.context,
    required this.productID,
  });
}

class GetSingleProduct extends StoreProductEvent {
  final Product? product;

  GetSingleProduct({required this.product});
}
