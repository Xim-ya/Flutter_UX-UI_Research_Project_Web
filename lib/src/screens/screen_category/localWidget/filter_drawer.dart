import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ux_research/src/utilities/index.dart';

class FilterDrawer extends StatelessWidget {
  FilterDrawer({Key? key}) : super(key: key);

  final vm = Get.put(ScreenVM(option: ScreenModel())); // View Model 연동

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: GetBuilder<ScreenVM>(
            init: vm,
            builder: (context) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* Left */
                  leftBanner(),
                  /* Right */
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        ListView.builder(
                          padding: EdgeInsets.only(top: 62),
                          shrinkWrap: true,
                          itemCount: vm.optionList.length,
                          itemBuilder: (context, index) {
                            /* 선택된 언어 여부에 따라 다른 값을 호출 */
                            var optionsBasedOnLanguage = vm.isEnglish
                                ? vm.optionList[index].title.keys
                                : vm.optionList[index].title.values;
                            return TextButton(
                              onPressed: () {
                                vm.setToggleOption(vm.optionList[index]);
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
                                    vm.selectedOptionList
                                            .contains(vm.optionList[index])
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
                        ),
                        listHeader(),
                      ],
                    ),
                  ),
                ],
              );
            }));
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
      child: Center(
        child: Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: vm.selectedType,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const TextSpan(
                text: " 옵션",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* 필터 옵션 버튼의 리스트 위젯 */
  Container leftBanner() {
    return Container(
      decoration: const BoxDecoration(
          border:
              Border(right: BorderSide(width: 1, color: kDrawerBorderColor))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              leadingBannerButton(),
              bannerDivier(),
              filterButton("icons/category_big_ic.svg", 0, "category"),
              filterButton("icons/pattern_big_ic.svg", 1, "pattern"),
              filterButton("icons/element_big_ic.svg", 2, "element"),
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
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              vm.toggleLanguage();
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
          ),
          /* Button Title */
          const Padding(
            padding: EdgeInsets.only(top: 4, bottom: 12),
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
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          vm.model.fetchAllOption();
        },
        child: Container(
          child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1, color: Colors.grey)),
              child: const Center(
                child: Text(
                  "ALL",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              )),
        ),
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
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              vm.filterListBasedOnType(optionType);
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
