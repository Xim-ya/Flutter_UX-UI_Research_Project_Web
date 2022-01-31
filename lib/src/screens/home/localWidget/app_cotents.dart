import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';

// HomeScreen에서 사용되는 위젯. App 옵션이 선택되었을 때 표시되는 컨텐츠

class AppContents extends StatelessWidget {
  const AppContents({
    Key? key,
    required this.company,
    required this.category,
    required this.name,
  }) : super(key: key);

  final String company;
  final String category;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
            separatorBuilder: (_, __) => sectionDivider(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainCategory(
                        company: company, category: category), // 회사 & 서비스
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ApplicationName(name: name), // 어플리케이션 이름
                        const SizedBox(height: _sizedHeight),
                        const ResponsiveLayout(
                          // 썸네일 컨텐츠 리스트
                          mobileBody: ThumbnailLogo(), // 모바일
                          desktopBody: ThumbnailList(), // 데스크탑
                        )
                      ],
                    )
                  ],
                )),
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
