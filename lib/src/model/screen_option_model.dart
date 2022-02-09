import 'package:ux_research/src/utilities/index.dart';

class ScreenOptionModel {
  List<ScreenOption> screenOptions = screenOptionList;
  int selectedType = 0;

  // 선택된 타입을 기준으로 스크린 옵션값들은 재정의하는 동작
  void filterListBasedOnType(int type) {
    selectedType = type;
    var newArray =
        screenOptionList.where((e) => e.type == selectedType).toList();
    screenOptions = newArray;
  }
}

class ScreenOption {
  String title;
  int type;
  bool selected;
  ScreenOption(this.title, this.type, this.selected);
}
