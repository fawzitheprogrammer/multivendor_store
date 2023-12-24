part of 'get_all_products_bloc.dart';

@immutable
sealed class GetAllProductsState {}

final class GetAllProductsInitial extends GetAllProductsState {}

final class GetAllProductsLoading extends GetAllProductsState {}

final class GetAllProductsSuccess extends GetAllProductsState {
  final List<Product> products;

  GetAllProductsSuccess({required this.products});
}

final class GetAllProductsFailure extends GetAllProductsState {
  final String errorMessage;

  GetAllProductsFailure({required this.errorMessage});
}
