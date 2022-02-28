import 'package:ux_research/src/utilities/index.dart';

class ScreenOptionVM extends GetxController {
  bool isEnglish = true;
  ScreenOptionModel newOption;

  ScreenOptionVM({required ScreenOptionModel option})
      : newOption = option; // 모델과 연동

  List<ScreenOption> get optionList {
    return newOption.screenOptions;
  }

  List<ScreenOption> get selectedOptionList {
    return newOption.selectedScreenOptions;
  }

  /* Drawer 상단에 보여지는 Title text */
  String get selectedType {
    switch (newOption.selectedType) {
      case 0:
        return "Category";
      case 1:
        return "Pattern";
      case 2:
        return "Element";
      default:
        return "ALL";
    }
  }

  void setOption(ScreenOption item) {
    newOption.setOption(item);
    update();
  }

  void setToggleOption(ScreenOption item) {
    newOption.setToggleOption(item);
    update();
  }

  void filterListBasedOnType(int type) {
    newOption.filterListBasedOnType(type);
    update();
  }

  void fetchAllList() {
    newOption.fetchAllList();
    print("fetch all list");
    update();
  }

  void toggleLanguage() {
    isEnglish = !isEnglish;
    update();
  }
}
