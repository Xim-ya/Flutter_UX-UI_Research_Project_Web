import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';

class SelectOptionSlider extends StatelessWidget {
  SelectOptionSlider(this.openDrawer, {Key? key}) : super(key: key);
  final openDrawer;
  final c =
      Get.put(ScreenOptionVM(option: ScreenOptionModel())); // View Model 연동

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScreenOptionVM>(
        init: c,
        builder: (context) {
          return Container(
            height: 50,
            child: Container(
              alignment: Alignment.center,
              height: 34,
              child: ListView.separated(
                  padding: const EdgeInsets.only(left: 38, top: 8, bottom: 8),
                  scrollDirection: Axis.horizontal,
                  // 옵션 리스트 중 'selected' 프로퍼티가 true boolean 값을 가지고 있는 인스턴스만 리턴
                  itemCount: 1 + c.selectedOptionList.length,
                  itemBuilder: (ctx, index) {
                    if (index == 0) {
                      // 헤더 값 반환
                      return addCategoryButton();
                    }
                    index -= 1;
                    var item = c.selectedOptionList[index];
                    var optionsBasedOnLanguage =
                        c.isEnglish ? item.title.keys : item.title.values;
                    return Container(
                        height: _squareSize,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(_buttonRadius),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(_shadowOpacity),
                              spreadRadius: _spreadRadius,
                              blurRadius: _blurRadius,
                              offset: _shadowOffset,
                            ),
                          ],
                          border:
                              Border.all(color: kButtonBorderColor, width: 0.6),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(optionCategory[item.type] ?? ""),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 6),
                              child: Text(
                                optionsBasedOnLanguage
                                    .toString()
                                    .replaceAll("(", "")
                                    .replaceAll(")", ""),
                                style: TextStyle(
                                    color: kDarkGrey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                c.setToggleOption(item); // 옵션 삭제 로직
                              },
                              child: SvgPicture.asset(
                                "icons/close_circle_ic.svg",
                              ),
                            ),
                          ],
                        ));
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(width: 10)),
            ),
          );
        });
  }

  /* 카테고리 옵션 추가 버튼 '+' */
  Container addCategoryButton() {
    return Container(
      height: _squareSize,
      width: _squareSize,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_buttonRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(_shadowOpacity),
            spreadRadius: _spreadRadius,
            blurRadius: _blurRadius,
            offset: _shadowOffset,
          ),
        ],
        border: Border.all(color: kButtonBorderColor, width: 0.6),
      ),
      child: IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          hoverColor: Colors.white,
          iconSize: 16,
          onPressed: () {
            openDrawer();
          },
          icon: SvgPicture.asset("icons/plus_ic.svg")),
    );
  }

  /* Styling (Option Button) */
  static const double _buttonRadius = 4;
  static const double _shadowOpacity = 0.25;
  static const double _spreadRadius = 0;
  static const double _blurRadius = 6;
  static const Offset _shadowOffset = Offset(2, 3);
  static const double _squareSize = 34;
}
