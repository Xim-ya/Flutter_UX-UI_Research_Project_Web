import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';

class ScreenContents extends StatelessWidget {
  const ScreenContents({Key? key, required this.imageList}) : super(key: key);
  //TODO : 나중에 데이터 오브젝트를 받아와야됨.
  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
        scroll: false,
        desiredItemWidth: 225,
        minSpacing: 24,
        children: imageList.map((item) {
          return UIContent(image: item, isExpanded: false);
        }).toList());
  }
}
