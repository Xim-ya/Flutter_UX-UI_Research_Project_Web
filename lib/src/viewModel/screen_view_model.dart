import 'package:ux_research/src/utilities/index.dart';

class ScreenVM extends GetxController {
  bool isEnglish = true;
  ScreenModel model;

  ScreenVM({required ScreenModel option}) : model = option; // 모델과 연동

  List<ScreenOption> get optionList {
    return model.screenOptions;
  }

  List<ScreenOption> get selectedOptionList {
    return model.selectedScreenOptions;
  }

  List<ScreenShot> get screenshots {
    return model.screenshotList;
  }

  /* Drawer 상단에 보여지는 Title text */
  String get selectedType {
    switch (model.selectedType) {
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

  /* Intent */
  /** Screenshots 비즈니스 로직 **/

  @override
  void onInit() {
    super.onInit();
    // 처음 스크린샷 리스트들을 무작위로 섞어서 호출
    model.shuffleScreenshotsList();
    update();
  }

  void fetchScreenshots() {
    model.fetchScreenshots();
    update();
  }

  /** ScreenOptions 비즈니스 로직  **/
  void setOption(ScreenOption item) {
    model.setOption(item);
    update();
  }

  void setToggleOption(ScreenOption item) {
    model.setToggleOption(item);
    update();
  }

  void filterListBasedOnType(int type) {
    model.filterListBasedOnType(type);
    update();
  }

  void fetchAllOption() {
    model.fetchAllOption();
    update();
  }

  void toggleLanguage() {
    isEnglish = !isEnglish;
    update();
  }
}
