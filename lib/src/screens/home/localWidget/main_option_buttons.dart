import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';

// 홈스크린 상단 Apps, Screens Toggle Button 위젯

class MainOptionButtons extends StatelessWidget {
  const MainOptionButtons({
    Key? key,
    required ValueNotifier<bool> isBasicOption,
  })  : _isBasicOption = isBasicOption,
        super(key: key);

  final ValueNotifier<bool> _isBasicOption;

  // 스크린 사이즈에 따라 alignment와 bottomPadding 사이즈가 달라짐.
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktopBody: desktopButtons(MainAxisAlignment.center, 102),
      mobileBody: desktopButtons(MainAxisAlignment.start, 56),
    );
  }

  Column desktopButtons(MainAxisAlignment alignment, double sizedHeight) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: alignment,
          children: [
            option1("Apps", false),
            const SizedBox(width: 20),
            option2("Screens", true),
          ],
        ),
        SizedBox(height: sizedHeight),
      ],
    );
  }

  GestureDetector option1(String content, bool inputValue) {
    return GestureDetector(
      onTap: () {
        _isBasicOption.value = inputValue;
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(content,
            style: TextStyle(
                color: _isBasicOption.value ? kLightGrey : kDarkGrey,
                fontSize: 36,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  GestureDetector option2(String content, bool inputValue) {
    return GestureDetector(
      onTap: () {
        _isBasicOption.value = inputValue;
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(content,
            style: TextStyle(
                color: !_isBasicOption.value ? kLightGrey : kDarkGrey,
                fontSize: 36,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
