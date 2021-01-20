import 'package:emag_clone_gad/src/presentation/home.dart';
import 'package:emag_clone_gad/src/presentation/login/login_page.dart';
import 'package:emag_clone_gad/src/presentation/login/reset_password_page.dart';
import 'package:emag_clone_gad/src/presentation/products/searched_products_page.dart';
import 'package:emag_clone_gad/src/presentation/register/name_page.dart';
import 'package:emag_clone_gad/src/presentation/register/password_page.dart';
import 'package:emag_clone_gad/src/presentation/register/register_page.dart';
import 'package:flutter/cupertino.dart';

// ignore: avoid_classes_with_only_static_members
class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String displayName = '/name';
  static const String password = '/password';
  static const String resetPassword = '/resetPassword';
  static const String searchProducts = '/searchProducts';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const Home(),
    login: (BuildContext context) => const LoginPage(),
    register: (BuildContext context) => const RegisterPage(),
    displayName: (BuildContext context) => const NamePage(),
    password: (BuildContext context) => const PasswordPage(),
    resetPassword: (BuildContext context) => const ResetPasswordPage(),
    searchProducts: (BuildContext context) => const SearchedProductsPage(),
  };
}
