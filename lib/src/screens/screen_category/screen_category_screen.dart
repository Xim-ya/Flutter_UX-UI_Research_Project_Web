import 'package:flutter/material.dart';
import 'package:ux_research/src/screens/home/localWidget/search_filter_slider.dart';

import 'package:ux_research/src/utilities/index.dart';

class ScreenCategoryScreen extends StatefulWidget {
  const ScreenCategoryScreen({Key? key}) : super(key: key);

  @override
  State<ScreenCategoryScreen> createState() => _ScreenCategoryScreenState();
}

class _ScreenCategoryScreenState extends State<ScreenCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    void openDrawer() {
      _key.currentState!.openDrawer();
    }

    return Scaffold(
        key: _key,
        appBar: HomeAppBar(),
        drawer: FilterDrawer(),
        body: ScrollEndModifier(
          child: MaxWidthContainer(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /* 스크린 제목 (Indicator Text) */

                SearchFilterSlider(openDrawer),
                Flexible(
                  child: ScreenContents(
                    imageList: imageList,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
