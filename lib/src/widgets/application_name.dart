import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';

class ApplicationName extends StatelessWidget {
  const ApplicationName({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return OnHoverText(builder: (isHovered) {
      final color = isHovered ? Colors.black : kDarkGrey;
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: Text(
            name,
            style: TextStyle(
                color: color, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      );
    });
  }
}
