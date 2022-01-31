import 'package:flutter/material.dart';

// 스크롤 위젯, 화면 끝까지 스크롤 했을 시 특정 동작을 수행하는함.

class ScrollEndModifier extends StatelessWidget {
  const ScrollEndModifier({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();

    // Scroll Controller, 화면 끝까지 스크롤 되었을 시 더 많은 컨텐츠 리스트를 호출.
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isBottom = _scrollController.position.pixels != 0;
        if (isBottom) {
          print("It is The End of Content, load more!");
        }
      }
    });
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(controller: _scrollController, child: child),
    );
  }
}
