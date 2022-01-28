import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';
import 'package:ux_research/src/widgets/on_hover_content.dart';

class ContentUID extends StatelessWidget {
  const ContentUID({Key? key}) : super(key: key);

  static const List<String> imageList = [
    'images/tada_splash.png',
    'images/tada_home_01.png',
    'images/tada_others_01.png',
    'images/tada_ride_01.png',
    'images/tada_ride_05.png'
  ];

  // Horizontal List 위젯
  Widget contenUItList(List<String> contents) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: contents.map((item) => UIContent(image: item)).toList());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: _contentHeight,
        child: contenUItList(imageList),
      ),
    );
  }

  static const double _contentHeight = 486;
  static const double _spread = 5;
  static const double _blur = 7;
  static const double _contentRadius = 16;
}

/* 개별 아이템 */

class UIContent extends StatelessWidget {
  const UIContent({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return OnHoverContent(
      child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: kShadowColor,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(image: AssetImage(image)))),
    );
  }
}
