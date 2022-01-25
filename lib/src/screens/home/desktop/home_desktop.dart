import 'package:flutter/material.dart';

class HomeScreenD extends StatelessWidget {
  const HomeScreenD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("HomeScreen Desktop"),
          Text("안녕하세요",
              style: TextStyle(
                  fontFamily: "SpoqaHanSansNeo", fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
