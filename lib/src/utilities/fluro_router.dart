//FluroRouter.dart
import 'package:flutter/material.dart';
import 'package:ux_research/src/screens/temp_screen.dart';
import 'package:ux_research/src/utilities/index.dart';

/* Fluro 패키지 기반 라우팅 클래스 */

class FRouter {
  static FluroRouter router = FluroRouter();

  static var homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return HomeScreen();
  });
  static var screenHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ScreenCategoryScreen();
  });
  static var tempHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return TempScreen();
  });

  static void setupRouter() {
    router.define('/', handler: homeHandler);
    router.define('/screen',
        handler: screenHandler, transitionType: TransitionType.fadeIn);
    router.define('/temp', handler: tempHandler);
  }
}
