import 'package:ux_research/src/utilities/index.dart';

List<ScreenOption> screenOptionList = [
  /* Category  */
  ScreenOption({"Food": "음식"}, 0),
  ScreenOption({"Shopping": "쇼핑"}, 0),

  /* Pattern  */
  ScreenOption({"Launch Screen": "런치 스크린"}, 1),
  ScreenOption({"Welcome & Get Started": "런치 스크린"}, 1),
  ScreenOption({"Signup": "회원가입"}, 1),
  ScreenOption({"Login": "로그인"}, 1),

  /* Element */
  ScreenOption({"TextField": "텍스트 필드"}, 2),
  ScreenOption({"Slider": "슬라이더"}, 2),
  ScreenOption({"Tab Bar": "탭바"}, 2),
  ScreenOption({"Search Bar": "검색바"}, 2),
];

const Map<int, String> optionCategory = {
  0: "icons/pattern_ic.svg",
  1: "icons/element_ic.svg",
  2: "icons/category_ic.svg"
};
