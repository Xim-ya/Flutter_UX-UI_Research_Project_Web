import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';

// 전달 받은 Widget을 기준으로 양 옆에 여백을 주는 View Modifier

class MaxWidthContainer extends StatelessWidget {
  const MaxWidthContainer({Key? key, required this.passedWidget})
      : super(key: key);

  final Widget passedWidget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kMaxWidth),
        child: passedWidget,
      ),
    );
  }
}
