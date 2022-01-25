import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';

// 홈스크린 > 아이템 리스트 > 아이템 > 메인 카테고리
// 어플리케이션의 회사명과 카테고리를 보여주는 위젯

class MainCategory extends StatelessWidget {
  const MainCategory({
    Key? key,
    required this.company,
    required this.category,
  }) : super(key: key);

  final String company;
  final String category;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.only(bottom: 9),
        child: Row(
          children: [
            Text(
              company,
              style: const TextStyle(
                  color: kLightBlue, fontWeight: FontWeight.w100, fontSize: 16),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: VerticalDivider(thickness: 0.6, color: kLightBlue),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Text(
                  category,
                  style: const TextStyle(
                      color: kLightBlue,
                      fontWeight: FontWeight.w100,
                      fontSize: 16),
                ),
                onTap: () {
                  // 해당 카테고리 메뉴로 이동
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
