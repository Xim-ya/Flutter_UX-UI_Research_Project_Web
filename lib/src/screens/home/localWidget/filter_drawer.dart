import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({Key? key}) : super(key: key);

  void filterAction() {
    if (kDebugMode) {
      print("Filter Action");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Row(
      children: [
        /* Left */
        leftBanner(),
        /* Right */
        Expanded(
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) => Text(
              "Right",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    ));
  }

  Column leftBanner() {
    return Column(
      children: [
        filterButton("icons/filter_ic.svg", filterAction),
        filterButton("icons/menu_bar_ic.svg", filterAction),
      ],
    );
  }

  Container filterButton(String svgLocation, void Function() filterAction) {
    return Container(
      width: 56,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              filterAction();
            },
            child: Container(
              padding: EdgeInsets.all(8),
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1, color: Colors.grey)),
              child: SvgPicture.asset(
                svgLocation,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
