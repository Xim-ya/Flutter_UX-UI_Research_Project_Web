import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:ux_research/src/utilities/index.dart';
import 'package:ux_research/src/widgets/on_hover_content.dart';

class ScreenContents extends StatelessWidget {
  const ScreenContents({Key? key}) : super(key: key);
  static const List<int> dummy = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
        scroll: false,
        desiredItemWidth: 225,
        minSpacing: 10,
        children: dummy.map((i) {
          return uiContent();
        }).toList());
  }

  Stack uiContent() {
    return Stack(children: [
      OnHoverContent(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: _contentHMargin),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(_contentRadius)),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  spreadRadius: _spread,
                  blurRadius: _blur,
                  offset: _offset, // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(_contentRadius),
                child: Image(
                  image: AssetImage('images/tada_home_01.png'),
                ))),
      )
    ]);
  }

  /* Styling */
  static const double _contentHMargin = 9;
  static const double _spread = 5;
  static const double _blur = 7;
  static const Offset _offset = Offset(0, 3);
  static const double _contentRadius = 16;
}
