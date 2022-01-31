import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ux_research/src/screens/home/localWidget/screen_contents.dart';
import 'package:ux_research/src/utilities/index.dart';

/* Home Screen 반응형 레이아웃 빌더 */
class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // 임시 데이터.
  final String company = "KaKao Entertainment Crop.";
  final String category = "Entertainment";
  final String name = "카카오 웹툰";
  static const List<String> imageList = [
    'images/tada_splash.png',
    'images/tada_home_01.png',
    'images/tada_others_01.png',
    'images/tada_ride_01.png',
    'images/tada_ride_05.png'
  ];

  @override
  Widget build(BuildContext context) {
    final _isBasicOption = useState(false); // Hook 도입 (간단한 state 관리)

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const HomeAppBar(),
        body: ScrollEndModifier(
          // 스크롤 위젯 (화면 끝까지 스크롤 했을 시 특정 동작 수행)
          child: MaxWidthContainer(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MainOptionButtons(isBasicOption: _isBasicOption),
                _isBasicOption.value
                    ? Flexible(child: ScreenContents())
                    : // 'Screen' 옵션이 선택 되었을 시,
                    AppContents(
                        company: company, category: category, name: name),
              ],
            ),
          ),
        ));
  }
}
