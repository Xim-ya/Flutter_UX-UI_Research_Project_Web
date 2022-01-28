import 'package:flutter/material.dart';
import 'package:ux_research/src/responsive/thumnail_contentList_layout.dart';
import 'package:ux_research/src/screens/home/localWidget/thumbnail_list.dart';
import 'package:ux_research/src/screens/home/localWidget/thumnail_logo.dart';
import 'package:ux_research/src/utilities/index.dart';
import 'package:ux_research/src/widgets/max_width_container.dart';

/* Home Screen 반응형 레이아웃 빌더 */
class HomeScreen extends StatelessWidget {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const HomeAppBar(),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context)
            .copyWith(scrollbars: false), // 스크롤 바 숨기기
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const SizedBox(height: 64),
              MaxWidthContainer(
                child: ListView.separated(
                    separatorBuilder: (_, __) => sectionDivider(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) => uiContent()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* 아이템 섹션 */
  Column uiContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainCategory(company: company, category: category), // 회사 & 서비스
        ApplicationName(name: name), // 어플리케이션 이름
        const SizedBox(height: _sizedHeight),
        const ThumbnailContentList(
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
