part of 'register_store_bloc.dart';

@immutable
sealed class RegisterStoreEvent {}

class RegisterStore extends RegisterStoreEvent {
  final StoreModel storeModel;
  final XFile profilePic;
  final XFile idFrontSide;
  final XFile idBackSide;
  final XFile businessLicenseSide;
  final BuildContext context;

  RegisterStore({
    required this.profilePic,
    required this.idFrontSide,
    required this.idBackSide,
    required this.businessLicenseSide,
    required this.storeModel,
    required this.context,
  });
}
