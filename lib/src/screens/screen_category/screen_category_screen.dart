import 'package:flutter/material.dart';
import 'package:ux_research/src/model/screenShots_model.dart';

import 'package:ux_research/src/utilities/index.dart';
import 'package:ux_research/viewModel/screenshots_view_model.dart';

class ScreenCategoryScreen extends StatefulWidget {
  const ScreenCategoryScreen({Key? key}) : super(key: key);
  @override
  State<ScreenCategoryScreen> createState() => _ScreenCategoryScreenState();
}

class _ScreenCategoryScreenState extends State<ScreenCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    final vm = Get.put(ScreenShotsVM(model: ScreenShotsModel()));

    // Drawer를 Manual하게 동작하게 하는 로직.
    void openDrawer() {
      _key.currentState!.openDrawer();
    }

    return Scaffold(
        key: _key,
        appBar: HomeAppBar(),
        drawer: FilterDrawer(),
        body: ScrollEndModifier(
          child: MaxWidthContainer(
            child: GetBuilder<ScreenShotsVM>(
                init: vm,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /* 스크린 제목 (Indicator Text) */
                      SelectOptionSlider(openDrawer),
                      ScreenContents(vm: vm),
                    ],
                  );
                }),
          ),
        ));
  }
}
