import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/constants.dart';
import 'package:ux_research/src/utilities/data/screenshots_data.dart';
import 'package:ux_research/src/utilities/index.dart';

/* Home Screen 반응형 레이아웃 빌더 */
class HomeScreen extends HookWidget {
  HomeScreen({Key? key}) : super(key: key);

  // 임시 데이터.
  final String company = "KaKao Entertainment Crop.";
  final String category = "Entertainment";
  final String name = "카카오 웹툰";

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
      // drawer: FilterDrawer(),
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
              AppContents(screenShots: screenShots, apps: apps),
              /* ************** */
            ],
          ),
        ),
      ),
    );
  }
}

/* 'App' <---> 'Screen' 옵션 토글 버튼 리스트 (곧 삭제) */
// MainOptionButtons(isBasicOption: _isBasicOption),
/* 'Screen' Category 옵션 리스트 */
// SearchFilterSlider(openDrawer),
/* 임시 주석 처리 */
// Flexible(
//    child: ScreenContents(
//      imageList: imageList,
//    ),
//  )
// Textfield is not go as happening;;

// 'Screen' 옵션이 선택 되었을 시,
