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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainCategory(company: company, category: category), // 회사 & 서비스
        ApplicationName(name: name) // 어플리케이션 이름
      ],
    );
  }
}
