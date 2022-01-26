import 'package:flutter/material.dart';

/* 텍스트 위에 마우스가 Hover 되었을 시 나타는 Animation Effect Modifier */

class OnHoverText extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  const OnHoverText({Key? key, required this.builder}) : super(key: key);

  @override
  _OnHoverTextState createState() => _OnHoverTextState();
}

class _OnHoverTextState extends State<OnHoverText> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (event) => hovering(true),
        onExit: (event) => hovering(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: IntrinsicWidth(
            child: Column(
              children: [
                widget.builder(isHovered),
                AnimatedOpacity(
                  // Text Underline 위젯, Hover 유무에 따라 Opacity Animation이 적용됨.
                  opacity: isHovered ? 1.0 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: const Divider(color: Colors.black),
                )
              ],
            ),
          ),
        ));
  }

  void hovering(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
