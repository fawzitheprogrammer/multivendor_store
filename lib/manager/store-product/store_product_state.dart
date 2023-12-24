part of 'store_product_bloc.dart';

@immutable
sealed class StoreProductState {}

final class StoreProductInitial extends StoreProductState {}

final class StoreProductLoading extends StoreProductState {}

final class StoreProductSuccess extends StoreProductState {}

final class StoreProductFailure extends StoreProductState {
  final String errorMessage;

  StoreProductFailure({required this.errorMessage});
}

final class SingleProductState extends StoreProductState {
  final Product? product;

  SingleProductState({required this.product});
}
