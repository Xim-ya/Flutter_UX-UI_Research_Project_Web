import 'package:ux_research/src/utilities/index.dart';

// 모든 스크린 옵션들의 데이터와 비즈니스 로직들을 관리
class ScreenModel {
  /* ScreenShot 옵션 값 */
  List<ScreenOption> screenOptions = screenOptionList;
  List<ScreenOption> selectedScreenOptions = [];
  int selectedType = 0;

  /* ScreenShot 값 */
  List<ScreenShot> screenshotList = [];

  /**** 1) Screenshots 비즈니스 로직 ****/

  List<String> selectedOption = ["2slider", "2tabBar"];

  // 선택된 스크린샷 옵션 값들을 기준으로 스크린샷 아이템들을 호출
  void fetchScreenshots() {
    List<ScreenShot> filteredList = <ScreenShot>[];

    print("Filtered Options FIXED5 ${filteredList.length}");

    // List<int> list = <int>[];
    // if (list.contains(1)) print('someFunction4'); // OK
  }

  // 스크린샷 리스트들을 무작위 섞는 로직
  void shuffleScreenshotsList() {
    screenshotList = screenShots..shuffle();
  }

  /**** 2) Screen Option 비즈니스 로직 ****/

  // 선택된 타입을 기준으로 스크린 옵션값들은 재정의하는 동작
  void filterListBasedOnType(int type) {
    selectedType = type;
    var newArray =
        screenOptionList.where((e) => e.type == selectedType).toList();
    screenOptions = newArray;
  }

  // 모든 스크린 옵션 값들을 호출
  void fetchAllOption() {
    screenOptions = screenOptionList;
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

class TempItem {
  List<String> options;
  List<String> key;

  TempItem(this.options, this.key);
}
