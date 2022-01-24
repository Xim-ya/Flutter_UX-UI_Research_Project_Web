import 'package:ux_research/src/responsive/max_width_container.dart';
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
      theme: ThemeData(),
      home: const ResponsiveLayout(
        mobileBody: MobileHomeScreen(),
        tabletBody: TabletHomeScreen(),
        desktopBody: DesktopHomeScreen(),
      ),
    );
  }
}

// 반응형 레이아웃 빌더

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {Key? key, required this.mobileBody, this.tabletBody, this.desktopBody})
      : super(key: key);

  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, dimensions) {
          if (dimensions.maxWidth < kTabletBreakPoint) {
            // 모바일 Widget을 리턴
            return mobileBody;
          } else if (dimensions.maxWidth >= kTabletBreakPoint &&
              dimensions.maxWidth < kDesktopBreakPoint) {
            // 태블릿 Widget을 리턴
            return tabletBody ??
                mobileBody; // tablet위젯이 null 이라면 모바일 Widget을 리턴
          } else {
            // DesktopWidget을 리턴
            return desktopBody ??
                mobileBody; // desktop 위젯이 null 이라면 모바일 Widget을 리턴
          }
        },
      ),
    );
  }
}

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaxWidthContainer(
      passedWidget: Container(
        child: Text("MOBILE HOME SCREEN"),
      ),
    );
  }
}

class TabletHomeScreen extends StatelessWidget {
  const TabletHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("TABLE HOME SCREEN"),
    );
  }
}

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("DESKTOP HOME SCREEN"),
    );
  }
}
