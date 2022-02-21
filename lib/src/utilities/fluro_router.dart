//FluroRouter.dart
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ux_research/src/screens/home/home.dart';
import 'package:ux_research/src/screens/screen_category/screen_category_screen.dart';

class FRouter {
  static FluroRouter router = FluroRouter();

  static const String flumeDefault = '/screen';

  static var detailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ScreenCategoryScreen();
  });

  static void setupRouter() {
    router.define(flumeDefault,
        handler: detailHandler, transitionType: TransitionType.fadeIn);
  }
}
