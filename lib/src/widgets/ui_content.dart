import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';

/* 홈스크린에서 사용되는 어플리케이션 캡쳐 스크린(UI Content) */
class UIContent extends StatelessWidget {
  const UIContent({
    Key? key,
    required this.image,
    required this.isExpanded,
  }) : super(key: key);

  final String image; // 아이템 데이터, 이미지에서 오브젝트 데이터 형태로 구성되어야 함.
  final bool isExpanded; // Expand한 위젯 유무

  @override
  Widget build(BuildContext context) {
    // 'App' 옵션 -> Expand 속성 필요, 'Screen 옵션' -> Expanded 속성 불필요
    return isExpanded ? expendContent() : content();
  }

  Expanded expendContent() {
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

  Stack content() {
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
                  image: AssetImage(image),
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
