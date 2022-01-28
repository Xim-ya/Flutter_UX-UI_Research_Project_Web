import 'package:flutter/material.dart';
import 'package:ux_research/src/widgets/on_hover_content.dart';

class ThumbnailLogo extends StatelessWidget {
  const ThumbnailLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnHoverContent(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: SizedBox(
              height: 176,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "images/tada_logo.png",
                  fit: BoxFit.contain,
                ),
              )),
        ),
      ),
    );
  }
}
