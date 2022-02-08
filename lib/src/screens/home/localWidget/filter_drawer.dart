import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';

class FilterDrawer extends StatelessWidget {
  FilterDrawer({Key? key}) : super(key: key);

  final optionController =
      Get.put(ScreenOptionVM(option: ScreenOptionModel())); // View Model 연동
  void filterAction() {
    optionController.filterListBasedOnType(0);
  }

  @override
  Widget build(BuildContext context) {
    // final optionController =
    //     Get.put(ScreenOptionVM(option: ScreenOptionModel())); // View Model 연동
    return Drawer(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /* Left */
        leftBanner(),
        /* Right */
        Expanded(
          child: Stack(
            children: <Widget>[
              GetBuilder<ScreenOptionVM>(
                  init: ScreenOptionVM(option: ScreenOptionModel()),
                  builder: (_) {
                    return ListView.builder(
                      padding: EdgeInsets.only(top: 62),
                      shrinkWrap: true,
                      itemCount: _.optionList.length,
                      itemBuilder: (context, index) => TextButton(
                        onPressed: () {},
                        child: Container(
                          height: 56,
                          child: Center(
                              child: Text(
                            _.optionList[index].title,
                            style: TextStyle(color: Colors.red),
                          )),
                        ),
                      ),
                    );
                  }),
              listHeader(),
            ],
          ),
        ),
      ],
    ));
  }

  /* 오른쪽 옵션 리스트 뷰의 헤더 위젯 */
  Container listHeader() {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: kDrawerBorderColor),
        ),
      ),
      child: Center(
          child: Text.rich(TextSpan(children: <TextSpan>[
        TextSpan(
            text: "Pattern",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextSpan(
            text: " 옵션",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200)),
      ]))),
    );
  }

  /* 필터 옵션 버튼의 리스트 위젯 */
  Container leftBanner() {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(right: BorderSide(width: 1, color: kDrawerBorderColor))),
      child: Column(
        children: [
          leadingBannerButton(),
          bannerDivier(),
          filterButton("icons/menu_bar_ic.svg", filterAction, 0),
          filterButton("icons/menu_bar_ic.svg", filterAction, 1),
          filterButton("icons/menu_bar_ic.svg", filterAction, 2),
        ],
      ),
    );
  }

  Container bannerDivier() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 20,
      height: 1,
      color: kDrawerBorderColor,
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

  Container filterButton(
      String svgLocation, void Function() filterAction, int optionType) {
    return Container(
      width: 56,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /* Outlined Button , with SVG */
          GetBuilder<ScreenOptionVM>(
              init: ScreenOptionVM(option: ScreenOptionModel()),
              builder: (_) {
                return InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    _.filterListBasedOnType(optionType);
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
                );
              }),
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
