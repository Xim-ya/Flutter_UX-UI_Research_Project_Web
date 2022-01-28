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
      children: contents.map((item) => UIContent(image: item)).toList());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: contentUItList(imageList),
    );
  }
}

// TODO: SHOULD BE RESPONSIVE ON TABLET LAYOUT [V]
class UIContent extends StatelessWidget {
  const UIContent({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(children: [
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
                    image: AssetImage(image),
                  ))),
        )
      ]),
    );
  }

  /* Styling */
  static const double _contentHMargin = 9;
  static const double _spread = 5;
  static const double _blur = 7;
  static const Offset _offset = Offset(0, 3);
  static const double _contentRadius = 16;
}
