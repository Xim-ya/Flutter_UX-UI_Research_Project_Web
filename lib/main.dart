import 'package:ux_research/src/responsive/home_layout.dart';

import 'package:ux_research/src/utilities/index.dart';
import 'package:flutter/material.dart';
import 'package:ux_research/src/widgets/max_width_container.dart';

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
        home: const MaxWidthContainer(
          child: HomeLayout(
            mobileBody: HomeScreenM(),
            tabletBody: HomeScreenT(),
            desktopBody: HomeScreenD(),
          ),
        ));
  }
}

// class CenteredLayout extends StatelessWidget {
//   const CenteredLayout({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ConstrainedBox(
//         constraints: BoxConstraints(maxWidth: 1316.0),
//         child:
//       ),
//     );
//   }
// }
