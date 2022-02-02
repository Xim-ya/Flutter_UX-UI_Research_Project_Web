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
      home: ResponsiveSizer(
        builder: (BuildContext, Orientation, ScreenType) {
          return HomeScreen();
        },
      ),
    );
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
