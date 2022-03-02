import 'package:ux_research/src/utilities/index.dart';

List<ScreenShot> screenShots = [
  //* 타다 * //
  //Home
  ScreenShot(
      "타다 TADA", "LaunchScreen", ["2tabBar"], '홈', "/tada/tada_home_01.png"),
  ScreenShot(
      "타다 TADA", "LaunchScreen", ["2tabBar"], '홈', "/tada/tada_home_01.png"),
  ScreenShot("타다 TADA", null, ["2tabBar"], '홈', "/tada/tada_home_03.png"),
  ScreenShot("타다 TADA", null, ["2tabBar"], '홈', "/tada/tada_home_04.png"),
  ScreenShot("타다 TADA", null, ["2tabBar"], '홈', "/tada/tada_home_05.png"),
  // //탑승
  ScreenShot(
      "타다 TADA", "Permission", ["2tabBar"], '탑승', "/tada/tada_ride_01.png"),
  ScreenShot(
      "타다 TADA", "Permission", ["2tabBar"], '탑승', "/tada/tada_ride_02.png"),
  ScreenShot(
      "타다 TADA", "Permission", ["2slider"], '탑승', "/tada/tada_ride_03.png"),
  ScreenShot(
      "타다 TADA",
      null,
      [
        "2slider",
      ],
      '탑승',
      "/tada/tada_ride_04.png"),
  //즐겨찾기
  ScreenShot("타다 TADA", null, ["2tabBar"], '즐겨찾기', "/tada/tada_fav_01.png"),
  ScreenShot("타다 TADA", null, ["2slider"], '즐겨찾기', "/tada/tada_fav_02.png"),
  ScreenShot("타다 TADA", null, ["2slider"], '즐겨찾기', "/tada/tada_fav_03.png"),
  ScreenShot("타다 TADA", null, ["2slider"], '즐겨찾기', "/tada/tada_fav_04.png"),
  ScreenShot("타다 TADA", null, ["2slider"], '즐겨찾기', "/tada/tada_fav_05.png"),

  //* 쿠팡 *//
  //온보딩
  ScreenShot("쿠팡", null, ["2slider"], '온보딩', "/coupang/coupang_splash.png"),
  ScreenShot(
      "쿠팡", null, ["2slider"], '온보딩', "/coupang/coupang_onboarding_01.png"),
  ScreenShot(
      "쿠팡", null, ["2slider"], '온보딩', "/coupang/coupang_onboarding_02.png"),
  ScreenShot(
      "쿠팡", null, ["2slider"], '온보딩', "/coupang/coupang_onboarding_03.png"),
  ScreenShot(
      "쿠팡", null, ["2slider"], '온보딩', "/coupang/coupang_onboarding_04.png"),
  //홈
  ScreenShot("쿠팡", null, ["2slider"], '홈', "/coupang/coupang_home_01.png"),
  ScreenShot("쿠팡", null, ["2slider"], '홈', "/coupang/coupang_home_02.png"),
  ScreenShot("쿠팡", null, ["2slider"], '홈', "/coupang/coupang_home_03.png"),
  ScreenShot("쿠팡", null, ["2slider"], '홈', "/coupang/coupang_home_04.png"),
  //카테고리
  ScreenShot(
      "쿠팡", null, ["2slider"], '카테고리', "/coupang/coupang_category_01.png"),
  ScreenShot(
      "쿠팡", null, ["2slider"], '카테고리', "/coupang/coupang_category_02.png"),
  ScreenShot(
      "쿠팡", null, ["2slider"], '카테고리', "/coupang/coupang_category_03.png"),
  ScreenShot(
      "쿠팡", null, ["2slider"], '카테고리', "/coupang/coupang_category_04.png"),
  //내정보
  ScreenShot("쿠팡", null, ["2slider"], '내정보', "/coupang/coupang_my_01.png"),
  ScreenShot("쿠팡", null, ["2slider"], '내정보', "/coupang/coupang_my_02.png"),
  ScreenShot("쿠팡", null, ["2slider"], '내정보', "/coupang/coupang_my_03.png"),
  ScreenShot("쿠팡", null, ["2slider"], '내정보', "/coupang/coupang_my_04.png"),
];

List<App> apps = [
  const App("타다 TADA", "VCNC", ["홈", "탑승", "즐겨찾기"], 0, "tada"),
  const App("쿠팡", "coupang", ["온보딩", "홈", "카테고리", "내정보"], 1, "coupang")
];

class App {
  final String name;
  final String company;
  final List<String> sections;
  final int? category;
  final String path;
  const App(this.name, this.company, this.sections, this.category, this.path);
}

class ScreenShot {
  final String appName;
  final String? pattern;
  final List<String>? element;
  final String? section;
  final String imagePath;

  const ScreenShot(
      this.appName, this.pattern, this.element, this.section, this.imagePath);
}

/* <ScreenOption> 모델 타입 */
class ScreenOption {
  Map<String, String> title;
  int type;
  String key;

  ScreenOption(this.title, this.type, this.key);
}

/*
// 이런 느낌?

/tada/sHome_pLogin_eButton_eTextField.png
/tada/sOnboarding_pLogin_eButton_eTextField.png

아래와 같이 호출해야됨.
"assets/images/screenshot/tada/tada_s홈_pMain_eTextField_eButton.png"
*/

// App("타다 TADA", "VCNC", ["홈", "탑승", "즐겨찾기", "예약", "기타메뉴"], 0)
