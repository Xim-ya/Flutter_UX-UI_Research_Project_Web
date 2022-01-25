import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';
import 'package:ux_research/src/widgets/app_bar.dart';

/* Home Screen 반응형 레이아웃 빌더 */
class HomeLayout extends StatelessWidget {
  const HomeLayout(
      {Key? key, required this.mobileBody, this.tabletBody, this.desktopBody})
      : super(key: key);

  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(),
        body: Container(
          child: Column(
            children: [
              Text("안녕하세요 달라진게 있나요?"),
              Text("THEME DATA, like a list"),
              Text(
                "THEME DATA, like a list",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "THEME DATA, like a list",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'SpoqaHanSansNeo'),
              ),
            ],
          ),
        ));
  }
}
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: PreferredSize(
//       preferredSize: Size.fromHeight(100.0),
//       child: AppBar(
//         title: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[Text("Hi"), Text("you")],
//         ),
//       ),
//     ),
//     body: LayoutBuilder(
//       builder: (context, dimensions) {
//         if (dimensions.maxWidth < kTabletBreakPoint) {
//           // 모바일 Widget을 리턴
//           return mobileBody;
//         } else if (dimensions.maxWidth >= kTabletBreakPoint &&
//             dimensions.maxWidth < kDesktopBreakPoint) {
//           // 태블릿 Widget을 리턴
//           return tabletBody ??
//               mobileBody; // tablet위젯이 null 이라면 모바일 Widget을 리턴
//         } else {
//           // DesktopWidget을 리턴
//           return desktopBody ??
//               mobileBody; // desktop 위젯이 null 이라면 모바일 Widget을 리턴
//         }
//       },
//     ),
//   );
// }
// }
