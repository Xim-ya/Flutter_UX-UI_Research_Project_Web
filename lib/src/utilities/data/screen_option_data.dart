import 'package:ux_research/src/utilities/index.dart';

List<ScreenOption> screenOptionList = [
  /* Category  */
  ScreenOption({"Food": "음식"}, 0, "0food"),
  ScreenOption({"Shopping": "쇼핑"}, 0, "0shopping"),

  /* Pattern  */
  ScreenOption({"Launch Screen": "런치 스크린"}, 1, '1launch'),
  ScreenOption({"Welcome & Get Started": "런치 스크린"}, 1, '1welcome'),
  ScreenOption({"Signup": "회원가입"}, 1, '1signup'),
  ScreenOption({"Login": "로그인"}, 1, '1login'),

  /* Element */
  ScreenOption({"TextField": "텍스트 필드"}, 2, '2textField'),
  ScreenOption({"Slider": "슬라이더"}, 2, '2slider'),
  ScreenOption({"Tab Bar": "탭바"}, 2, '2tabBar'),
  ScreenOption({"Search Bar": "검색바"}, 2, '2searchbar'),
];

const Map<int, String> optionCategory = {
  0: "icons/pattern_ic.svg",
  1: "icons/element_ic.svg",
  2: "icons/category_ic.svg"
};
