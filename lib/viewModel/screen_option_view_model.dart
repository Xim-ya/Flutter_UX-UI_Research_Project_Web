import 'package:ux_research/src/utilities/index.dart';

class ScreenOptionVM extends GetxController {
  ScreenOptionModel newOption;

  ScreenOptionVM({required ScreenOptionModel option})
      : newOption = option; // 모델과 연동

  List<ScreenOption> get optionList {
    return newOption.screenOptions;
  }

  List<ScreenOption> get selectedOptionList {
    return newOption.selectedScreenOptions;
  }

  String get selectedType {
    switch (newOption.selectedType) {
      case 0:
        return "옵션1";
      case 1:
        return "옵션2";
      case 2:
        return "옵션3";
      default:
        return "선택되지 않음";
    }
  }

  void setOption(ScreenOption item) {
    newOption.setOption(item);
  }

  void filterListBasedOnType(int type) {
    newOption.filterListBasedOnType(type);
    update();
  }
}