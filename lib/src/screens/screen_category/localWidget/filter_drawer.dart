import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ux_research/src/utilities/index.dart';

class FilterDrawer extends StatelessWidget {
  FilterDrawer({Key? key}) : super(key: key);

  final c =
      Get.put(ScreenOptionVM(option: ScreenOptionModel())); // View Model 연동

  @override
  Widget build(BuildContext context) {
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
                  init: c,
                  builder: (context) {
                    return ListView.builder(
                      padding: EdgeInsets.only(top: 62),
                      shrinkWrap: true,
                      itemCount: c.optionList.length,
                      itemBuilder: (context, index) {
                        /* 선택된 언어 여부에 따라 다른 값을 호출 */
                        var optionsBasedOnLanguage = c.isEnglish
                            ? c.optionList[index].title.keys
                            : c.optionList[index].title.values;
                        return TextButton(
                          onPressed: () {
                            c.setToggleOption(c.optionList[index]);
                          },
                          child: Container(
                            height: 56,
                            child: Stack(
                              children: [
                                Center(
                                  child: Text(
                                    optionsBasedOnLanguage
                                        .toString()
                                        .replaceAll("(", "")
                                        .replaceAll(")", ""),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                c.selectedOptionList
                                        .contains(c.optionList[index])
                                    // 옵션이 선택되었다면 아이콘 위젯을 보여줌.
                                    ? Positioned(
                                        top: 0,
                                        bottom: 0,
                                        right: 0,
                                        child: SvgPicture.asset(
                                            "icons/fixing_pin_ic.svg"),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        );
                      },
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
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: kDrawerBorderColor),
        ),
      ),
      child: GetBuilder<ScreenOptionVM>(
          init: c,
          builder: (context) {
            return Center(
                child: Text.rich(TextSpan(children: <TextSpan>[
              TextSpan(
                  text: c.selectedType,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextSpan(
                  text: " 옵션",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200)),
            ])));
          }),
    );
  }

  /* 필터 옵션 버튼의 리스트 위젯 */
  Container leftBanner() {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(right: BorderSide(width: 1, color: kDrawerBorderColor))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              leadingBannerButton(),
              bannerDivier(),
              filterButton("icons/pattern_big_ic.svg", 0, "pattern"),
              filterButton("icons/element_big_ic.svg", 1, "element"),
              filterButton("icons/category_big_ic.svg", 2, "category"),
            ],
          ),
          languageButton(),
        ],
      ),
    );
  }

  Container languageButton() {
    return Container(
      width: 56,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /* Outlined Button , with SVG */
          GetBuilder<ScreenOptionVM>(
              init: c,
              builder: (_) {
                return InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    c.toggleLanguage();
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      color: kDarkGrey,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: SvgPicture.asset(
                      "icons/global_ic.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
          /* Button Title */
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 12),
            child: Text(
              "언어변경",
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

  Container filterButton(String svgLocation, int optionType, String title) {
    return Container(
      width: 56,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /* Outlined Button , with SVG */
          GetBuilder<ScreenOptionVM>(
              init: c,
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
              title,
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
