import 'package:emag_clone_gad/src/presentation/home.dart';
import 'package:flutter/cupertino.dart';

// ignore: avoid_classes_with_only_static_members
class AppRoutes {
  static const String home = '/';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    home : (BuildContext context) => const Home(),
  };
}