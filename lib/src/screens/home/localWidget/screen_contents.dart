import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';

class ScreenContents extends StatelessWidget {
  const ScreenContents({Key? key, required this.vm}) : super(key: key);
  //TODO : 나중에 데이터 오브젝트를 받아와야됨.

  final ScreenVM vm;
  @override
  Widget build(BuildContext context) {
    // final c = Get.put(ScreenShotsVM(model: ScreenShotsModel()));
    return Flexible(
      child: ResponsiveGridList(
          scroll: false,
          desiredItemWidth: 225,
          minSpacing: 24,
          children: vm.screenshots.map((item) {
            return GestureDetector(
                onTap: () {
                  vm.fetchScreenshots();
                },
                child: UIContent(screenShot: item, isExpanded: false));
          }).toList()),
    );
  }
}
