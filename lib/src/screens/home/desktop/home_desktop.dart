import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';

class HomeScreenD extends StatelessWidget {
  const HomeScreenD({Key? key}) : super(key: key);

  // 임시 데이터.
  final String company = "KaKao Entertainment Crop.";
  final String category = "Entertainment";
  final String name = "카카오 웹툰";

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainCategory(company: company, category: category), // 회사 & 서비스
        ApplicationName(name: name), // 어플리케이션 이름
        // temp
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          height: _contentHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContentItem(),
              ContentItem(),
              ContentItem(),
              ContentItem(),
              ContentItem(),
            ],
          ),
        ),

        /* 애플리케이션 스크린 캡쳐 리스트 */
        // SizedBox(
        //   height: _contentHeight, // 레이아웃 불일치 요소 있음, 일단 Desktop에서는 고정된 사이즈 값 적용.
        //   child: ListView.separated(
        //       itemCount: 5,
        //       // shrinkWrap: true,
        //       scrollDirection: Axis.horizontal,
        //       separatorBuilder: (BuildContext context, int index) =>
        //           SizedBox(height: 5),
        //       itemBuilder: (BuildContext context, int index) {
        //         return ContentItem();
        //       }),
        // )
      ],
    );
  }

  Container ContentItem() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(_contentRadius)),
          boxShadow: [
            BoxShadow(
              color: kShadowColor,
              spreadRadius: _spread,
              blurRadius: _blur,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(_contentRadius),
            child: const Image(image: AssetImage('images/tada_splash.png'))));
  }

  /* Styling Options */
  static const double _contentHeight = 486;
  static const double _spread = 5;
  static const double _blur = 7;
  static const double _contentRadius = 16;
}
