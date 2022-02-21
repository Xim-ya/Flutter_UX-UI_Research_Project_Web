import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/fluro_router.dart';
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
                ElevatedButton(
                    onPressed: () {
                      String nextPathArg = '/screen';
                      FRouter.router.navigateTo(context, nextPathArg);
                    },
                    child: Text("aiim")),
                Icon(Icons.ac_unit_sharp), // 임시 로고
                actionButtons(screenWidth)
              ],
            ),
          ),
        ],
      ),
    );
  }

  // AppBar 우측 버튼 리스트 , Desktop 레이아웃일 때 호출됨.
  Widget actionButtons(double screenWidth) {
    if (screenWidth > kAppBarBreakPoint) {
      return Row(
        children: [
          actionButton("Home", ScreenCategoryScreen()),
          actionButton("Screens", ScreenCategoryScreen()),
          actionButton("About", ScreenCategoryScreen()),
          actionButton("Contact", ScreenCategoryScreen()),
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
  Container actionButton(String content, Widget routeWidget) {
    return Container(
      margin: const EdgeInsets.only(right: 50),
      child: TextButton(
        onPressed: () {
          // print("Plesase c onsole ome")
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
