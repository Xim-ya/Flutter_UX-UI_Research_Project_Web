import 'package:ux_research/src/utilities/index.dart';
import 'package:flutter/material.dart';

void main() {
  FRouter.setupRouter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: WebScrollBehavior(), // 수평 스크롤 동작을 감지함.
      debugShowCheckedModeBanner: false,
      title: 'UX UI RESEARCH',
      theme: ThemeData(fontFamily: 'SpoqaHanSansNeo'),
      onGenerateRoute: FRouter.router.generator,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
      },
    );
  }
}

// TODO :
/*
 1. MainOptionToggleButton Widget 삭제
 2. SearchFilterSlider
*/
