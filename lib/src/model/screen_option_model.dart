import 'package:ux_research/src/utilities/index.dart';

// 모든 스크린 옵션들의 데이터와 비즈니스 로직들을 관리
class ScreenOptionModel {
  List<ScreenOption> screenOptions = screenOptionList;
  List<ScreenOption> selectedScreenOptions = [];
  int selectedType = 0;

  // 선택된 타입을 기준으로 스크린 옵션값들은 재정의하는 동작
  void filterListBasedOnType(int type) {
    selectedType = type;
    var newArray =
        screenOptionList.where((e) => e.type == selectedType).toList();
    screenOptions = newArray;
  }

  // 선택된 옵션 값들은 'selectedOptionList' 에서 관리함. (Toggle 로직)
  void setOption(ScreenOption item) {
    selectedScreenOptions.add(item);
  }

  void setToggleOption(ScreenOption item) {
    if (selectedScreenOptions.contains(item)) {
      // 이미 옵션이 선택되었다면 인자로 전달 받은 옵션을 리스트에서 제거
      selectedScreenOptions.removeWhere((e) => e == item);
    } else {
      // 옵션이 선택되어 있지 않다면 전달 받은 옵션을 리스트에 추가
      selectedScreenOptions.add(item);
    }
  }
}

/* <ScreenOption> 모델 타입 */
class ScreenOption {
  Map<String, String> title;
  int type;

  ScreenOption(
    this.title,
    this.type,
  );
}

/*
// 모든 스크린 옵션들의 데이터와 비즈니스 로직들을 관리
class ScreenOptionModel {
  List<ScreenOption> screenOptions = screenOptionList;
  List<ScreenOption> selectedScreenOptions = [];
  int selectedType = 0;

  // 선택된 타입을 기준으로 스크린 옵션값들은 재정의하는 동작
  void filterListBasedOnType(int type) {
    selectedType = type;
    var newArray =
        screenOptionList.where((e) => e.type == selectedType).toList();
    screenOptions = newArray;
  }

  // 선택된 옵션 값들은 'selectedOptionList' 에서 관리함. (Toggle 로직)
  void setOption(ScreenOption item) {
    selectedScreenOptions.add(item);
  }

  void setToggleOption(ScreenOption item) {
    if (selectedScreenOptions.contains(item)) {
      // 이미 옵션이 선택되었다면 인자로 전달 받은 옵션을 리스트에서 제거
      selectedScreenOptions.removeWhere((e) => e == item);
    } else {
      // 옵션이 선택되어 있지 않다면 전달 받은 옵션을 리스트에 추가
      selectedScreenOptions.add(item);
    }
  }
}

/* <ScreenOption> 모델 타입 */
class ScreenOption {
  String title;
  int type;
  ScreenOption(
    this.title,
    this.type,
  );
}
*/
