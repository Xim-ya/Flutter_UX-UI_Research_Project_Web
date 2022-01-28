import 'package:flutter/material.dart';
import 'package:ux_research/src/responsive/thumnail_contentList_layout.dart';
import 'package:ux_research/src/screens/home/localWidget/content_ui_D.dart';
import 'package:ux_research/src/screens/home/localWidget/content_ui_M.dart';
import 'package:ux_research/src/screens/home/localWidget/content_ui_T.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 64),
          MaxWidthContainer(
            // 마진 & Center Constraints Modifier 적용
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainCategory(company: company, category: category), // 회사 & 서비스
                ApplicationName(name: name), // 어플리케이션 이름
                /* UI 스크린샷 콘텐츠 리스트
                * Mobile < Tablet < Desktop 레이아웃으로 구분.
                * */
                const ThumbnailContentList(
                  mobileBody: ContentUIM(),
                  tabletBody: ContentUIT(),
                  desktopBody: ContentUID(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
