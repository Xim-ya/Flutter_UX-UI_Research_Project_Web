import 'package:ux_research/src/utilities/index.dart';

class ScreenOptionVM extends GetxController {
  ScreenOptionModel newOption;

  // 모델과 연동
  ScreenOptionVM({required ScreenOptionModel option}) : newOption = option;

  List<ScreenOption> get optionList {
    return newOption.screenOptions;
  }

  void filterListBasedOnType(int type) {
    newOption.filterListBasedOnType(type);
    update();
  }

  // List<ScreenOption> get optionList {
  //   return newOption.screenOptions;
  // }
}
