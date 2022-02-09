import 'package:flutter/material.dart';
import 'package:ux_research/src/utilities/index.dart';

class SearchFilterSlider extends StatelessWidget {
  SearchFilterSlider(this.openDrawer, {Key? key}) : super(key: key);
  final openDrawer;

  final optionController =
      Get.put(ScreenOptionVM(option: ScreenOptionModel())); // View Model 연동

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScreenOptionVM>(
        init: optionController,
        builder: (_) {
          return SizedBox(
            height: 34,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // 옵션 리스트 중 'selected' 프로퍼티가 true boolean 값을 가지고 있는 인스턴스만 리턴
                itemCount: _.optionList
                            .where((e) => e.selected == true)
                            .toList()
                            .length ==
                        0
                    ? 1
                    : _.optionList
                        .where((e) => e.selected == true)
                        .toList()
                        .length,
                itemBuilder: (ctx, index) {
                  if (index == 0) {
                    // 헤더 값 반환
                    return addCategoryButton();
                  }
                  index -= 1;
                  var item = _.optionList[index];
                  return Text(item.title);
                }),
          );
        });
  }

  /* 카테고리 옵션 추가 버튼 '+' */
  Container addCategoryButton() {
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 6,
            offset: const Offset(2, 3),
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
}

// Icon Butto
// InkWell(
// borderRadius: BorderRadius.circular(4),
// onTap: () {},
// child: Container(
// height: 34,
// width: 34,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(4),
// border:
// Border.all(color: kButtonBorderColor, width: 0.6),
// ),
// child: Padding(
// padding: const EdgeInsets.all(8),
// child: SvgPicture.asset(
// "icons/plus_ic.svg",
// ),
// ),
// ),
// );
