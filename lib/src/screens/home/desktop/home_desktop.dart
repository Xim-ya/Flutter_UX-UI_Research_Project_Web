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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Leading Part
          MainCategory(company: company, category: category),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Icon(
                Icons.add_comment,
                size: 20,
              ),
              onTap: () {},
            ),
          ),
          Text(
            name,
            style: TextStyle(
                color: kDarkGrey, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ],
      ),
    );
  }
}
