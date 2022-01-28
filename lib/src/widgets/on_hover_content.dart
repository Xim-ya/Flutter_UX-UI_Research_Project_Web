import 'package:flutter/material.dart';

/* UI content 위에 마우스가 Hover 되었을 시 나타나는 Animation Effect Modifier*/

class OnHoverContent extends StatefulWidget {
  const OnHoverContent({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<OnHoverContent> createState() => _OnHoverContentState();
}

class _OnHoverContentState extends State<OnHoverContent> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -8, 0);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
      onEnter: (event) => hovering(true),
      onExit: (event) => hovering(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transform,
        child: widget.child,
      ),
    );
  }

  void hovering(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
