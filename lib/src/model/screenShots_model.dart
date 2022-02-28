import 'package:get/get.dart';
import 'package:ux_research/src/model/screen_option_model.dart';
import 'package:ux_research/src/utilities/data/screenshots_data.dart';

class ScreenShotsModel {
  List<ScreenShot> screenShotList = screenShots
    ..shuffle(); //  스크린샷 아이템들을 랜덤으로 셔플하여 호출.

  final screenOptionModel = Get.put(ScreenOptionModel());
  List<String> selectedList = ["a", "b", "c", "d", "e"];
  List<String> tempList = ["a", "c", "z"];

  List<ScreenOption> selectedOptions = [
    ScreenOption({"TextField": "텍스트 필드"}, 2),
    ScreenOption({"Slider": "슬라이더"}, 2),
    ScreenOption({"Tab Bar": "탭바"}, 2),
    ScreenOption({"Search Bar": "검색바"}, 2),
  ];

  // 선택된 옵션 값에 따라 screenshots 아이템을 호출함
  void filteredScreenShots() {
    Iterable<ScreenShot> filteredList =
        screenShotList.where((e) => selectedOptions.contains(e.element));

    // Iterable<String> filteredList =
    //     tempList.where((e) => selectedList.contains(e));
    screenShotList = filteredList.toList();
    print(screenShotList.length);
  }
}
