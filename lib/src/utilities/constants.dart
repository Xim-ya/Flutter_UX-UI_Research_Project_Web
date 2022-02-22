const Map<int, String> optionCategory = {
  0: "icons/pattern_ic.svg",
  1: "icons/element_ic.svg",
  2: "icons/category_ic.svg"
};

final constantMap = const {
  2: 'helium',
  10: 'neon',
  18: 'argon',
};

// const Map<String, List<Temp>> screenShot = const {
//   "kakaoWebtoon": [Temp("aim")],
// };

class ScreenShot {
  int key;
  String pattern;
  String element;
  String category;

  ScreenShot(this.key, this.pattern, this.element, this.category);
}

class Temp {
  String temp;

  Temp(this.temp);
}
