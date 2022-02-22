import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/* 웹에서 Pointer를 감지하여 수평 스크롤 동작을 가능하게하는 클래스 */

class WebScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
