import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';

import 'localWidget/search_filter_slider.dart';

/* Home Screen 반응형 레이아웃 빌더 */
class HomeScreen extends HookWidget {
  HomeScreen({Key? key}) : super(key: key);

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
    final _isBasicOption = useState(true); // Hook 도입 (간단한 state 관리)
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    void openDrawer() {
      _key.currentState!.openDrawer();
    }

    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      drawer: FilterDrawer(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        openDrawer();
      }),
      appBar: const HomeAppBar(),
      body: ScrollEndModifier(
        // 스크롤 위젯 (화면 끝까지 스크롤 했을 시 특정 동작 수행)
        child: MaxWidthContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MainOptionButtons(isBasicOption: _isBasicOption),
              /* Horizontal Option View , Add Option List Button */
              SearchFilterSlider(openDrawer),
              /* 임시 주석 처리 */
              _isBasicOption.value
                  ? Flexible(
                      child: ScreenContents(
                      imageList: imageList,
                    ))
                  : // 'Screen' 옵션이 선택 되었을 시,
                  AppContents(company: company, category: category, name: name),
              /* ************** */
            ],
          ),
        ),
      ),
    );
  }
}
