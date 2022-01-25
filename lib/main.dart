import 'package:ux_research/src/responsive/home_layout.dart';

import 'package:ux_research/src/utilities/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UX UI RESEARCH',
      theme: ThemeData(fontFamily: 'SpoqaHanSansNeo'),
      home: const HomeLayout(
        mobileBody: HomeScreenM(),
        tabletBody: HomeScreenT(),
        desktopBody: HomeScreenD(),
      ),
    );
  }
}
