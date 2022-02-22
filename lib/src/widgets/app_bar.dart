import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:ux_research/src/utilities/index.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);
  final double appBarHeight = 100.0;

  @override
  get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return MaxWidthContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppBar(
            foregroundColor: kDarkGrey,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.ac_unit_sharp), // 임시 로고
                actionButtons(context, screenWidth)
              ],
            ),
          ),
        ],
      ),
    );
  }

  // AppBar 우측 버튼 리스트 , Desktop 레이아웃일 때 호출됨.
  Widget actionButtons(BuildContext context, double screenWidth) {
    if (screenWidth > kAppBarBreakPoint) {
      return Row(
        children: [
          actionButton(context, "Home", '/'),
          actionButton(context, "Screens", '/screen'),
          actionButton(context, "About", '/about'),
          actionButton(context, "Contact", 'temp'),
          IconButton(
            icon: SvgPicture.asset("icons/search_ic.svg"),
            onPressed: () {},
          )
        ],
      );
    } else {
      return IconButton(
        icon: SvgPicture.asset("icons/menu_bar_ic.svg"),
        onPressed: () {},
      );
    }
  }

  // 우측 버튼
  Container actionButton(
      BuildContext context, String content, String routeString) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    return Container(
      margin: const EdgeInsets.only(right: 50),
      child: TextButton(
        onPressed: () {
          // 현재 설정된 Route Path로 이동하는 동작일 때 새로고침 동작을 메뉴얼하게 동작하게 함.
          if (currentRoute == routeString) {
            html.window.location.reload();
          } else {
            // 인자로 전달 받은 Route Path로 이동
            FRouter.router.navigateTo(context, routeString);
          }
        },
        child: Text(
          content,
          style: const TextStyle(
              fontWeight: FontWeight.w300, fontSize: 16, color: kDarkGrey),
        ),
      ),
    );
  }
}
