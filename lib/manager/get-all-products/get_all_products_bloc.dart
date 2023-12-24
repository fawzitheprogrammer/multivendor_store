import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:multivendor_store/features/store-profile/data/models/product_model.dart';
import 'package:multivendor_store/manager/get-all-products/get_all_categories_from_firebase.dart';

part 'get_all_products_event.dart';
part 'get_all_products_state.dart';

class GetAllProductsBloc
    extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  GetAllProductsBloc() : super(GetAllProductsInitial()) {
    on<GetAllProductsEvent>((event, emit) async {
      if (event is GetProducts) {
        try {
          emit(GetAllProductsLoading());
          await GetProductsFromFirebase.getAllProduct(null).then(
            (value) {
              emit(
                GetAllProductsSuccess(products: value),
              );
            },
          );
        } on FirebaseException catch (e) {
          emit(
            GetAllProductsFailure(errorMessage: e.message!),
          );
        } on PlatformException catch (e) {
          emit(
            GetAllProductsFailure(errorMessage: e.message!),
          );
        }
      }
    });
  }
}
