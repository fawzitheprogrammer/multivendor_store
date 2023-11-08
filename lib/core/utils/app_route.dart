import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multivendor_store/features/all-chats/presentation/views/all_chats_view.dart';
import 'package:multivendor_store/features/home/presentation/views/home_view.dart';
import 'package:multivendor_store/features/product_edit/presentation/views/edit_product.dart';
import '../../features/chat/presentation/views/chat_view.dart';
import '../../features/forget-password/presentation/views/forget_password.dart';
import '../../features/login/presentation/views/login.dart';
import '../../features/registration/presentation/views/registration.dart';
import '../custom_transition_page.dart';

abstract class AppRoute {
  static const kLoginView = '/kLoginView';
  static const kRegistrationView = '/kRegistrationView';
  static const kForgetPassword = '/kForgetPassword';
  static const kCreateAccount = '/kCreateAccount';
  static const kStoreProfile = '/kStoreProfile';
  static const kProduct = '/kProduct';
  static const kStoreMoreInfo = '/kStoreMoreInfo';
  static const kChatScreen = '/kChatScreen';
  static const kAllChatScreen = '/kAllChatScreen';
  static const kEditProduct = '/kEditProduct';
  static const kFavorites = '/kFavorites';

  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      CustomGoRouter(
        path: kRegistrationView,
        page: const RegistrationView(),
      ).goRoute(),
      CustomGoRouter(
        path: kForgetPassword,
        page: const ForgetPasswordView(),
      ).goRoute(),
      CustomGoRouter(
        path: kChatScreen,
        page: const ChatView(),
      ).goRoute(),
      CustomGoRouter(
        path: kAllChatScreen,
        page: const AllChatsView(),
      ).goRoute(),
      CustomGoRouter(
        path: kEditProduct,
        page: const EditProductView(),
      ).goRoute(),
    ],
  );
}

class CustomGoRouter extends PageTransition {
  CustomGoRouter({required this.path, required this.page});

  final String path;
  final Widget page;

  @override
  GoRoute goRoute() {
    return GoRoute(
      path: path,
      builder: (context, state) => page,
      pageBuilder: (context, state) => pageTransition(
        context: context,
        state: state,
        child: page,
      ),
    );
  }
}

abstract class PageTransition {
  GoRoute goRoute();
}
