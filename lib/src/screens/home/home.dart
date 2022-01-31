import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final _isSelectedOptions = useState([true, false]);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const HomeAppBar(),
        body: ScrollEndModifier(
          // 스크롤 위젯 (화면 끝까지 스크롤 했을 시 특정 동작 수행)
          child: MaxWidthContainer(
            child: Column(
              children: [
                MainOptionButtons(isBasicOption: _isBasicOption),
                ListView.separated(
                    separatorBuilder: (_, __) => sectionDivider(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) => uiContent()),
              ],
            ),
          ),
        ));
  }

  /* 아이템 섹션 */
  Column uiContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainCategory(company: company, category: category), // 회사 & 서비스
        ApplicationName(name: name), // 어플리케이션 이름
        const SizedBox(height: _sizedHeight),
        const ResponsiveLayout(
          // 썸네일 컨텐츠 리스트
          mobileBody: ThumbnailLogo(), // 모바일
          desktopBody: ThumbnailList(), // 데스크탑
        )
      ],
    );
  }

  /* 섹션 구분 위젯 */
  Padding sectionDivider() {
    return const Padding(
      padding: EdgeInsets.only(top: _dividerPaddingT, bottom: _dividerPaddingB),
      child: Divider(),
    );
  }

  /* Styling */
  static const double _dividerPaddingT = 72;
  static const double _dividerPaddingB = 42;
  static const double _sizedHeight = 40;
}
