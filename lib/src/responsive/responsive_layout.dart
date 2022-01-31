import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {Key? key,
      required this.mobileBody,
      this.tabletBody,
      required this.desktopBody})
      : super(key: key);

  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimensions) {
        if (dimensions.maxWidth < kHomeUIListBreakPoint) {
          // 모바일 Widget을 리턴
          return mobileBody;
        } else {
          // DesktopWidget을 리턴
          return desktopBody;
          // desktop 위젯이 null 이라면 모바일 Widget을 리턴
        }
      },
    );
  }
}
