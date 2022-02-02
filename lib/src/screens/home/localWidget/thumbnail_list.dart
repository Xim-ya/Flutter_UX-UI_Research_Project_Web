import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';
import 'package:ux_research/src/widgets/on_hover_content.dart';

/* 홈스크린 썸네일 리스트 (Desktop, Tablet 레이아웃에서 발동) */

class ThumbnailList extends StatelessWidget {
  const ThumbnailList({Key? key}) : super(key: key);

  static const List<String> imageList = [
    'images/tada_splash.png',
    'images/tada_home_01.png',
    'images/tada_others_01.png',
    'images/tada_ride_01.png',
    'images/tada_ride_05.png'
  ];

  // Horizontal List 위젯
  Widget contentUItList(List<String> contents) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: contents
          .map((item) => UIContent(
                image: item,
                isExpanded: true,
              ))
          .toList());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: contentUItList(imageList),
    );
  }
}
