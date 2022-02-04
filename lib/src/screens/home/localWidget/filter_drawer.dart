import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_research/src/utilities/color.dart';

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

  Container leftBanner() {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(right: BorderSide(width: 1, color: kDrawerBorderColor))),
      child: Column(
        children: [
          leadingBannerButton(),
          bannerDivier(),
          filterButton("icons/menu_bar_ic.svg", filterAction),
          filterButton("icons/menu_bar_ic.svg", filterAction),
          filterButton("icons/menu_bar_ic.svg", filterAction),
        ],
      ),
    );
  }

  Container bannerDivier() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 20,
      height: 1,
      color: kLightGrey,
    );
  }

  Container leadingBannerButton() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.all(8),
      height: 36,
      width: 36,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 1, color: Colors.grey)),
      child: SvgPicture.asset(
        "icons/filter_ic.svg",
        fit: BoxFit.cover,
      ),
    );
  }

  Container filterButton(String svgLocation, void Function() filterAction) {
    return Container(
      width: 56,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /* Outlined Button , with SVG */
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
          /* Button Title */
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 12),
            child: Text(
              "element",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
