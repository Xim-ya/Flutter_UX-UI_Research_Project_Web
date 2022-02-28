import 'package:ux_research/src/model/screenShots_model.dart';
import 'package:ux_research/src/utilities/data/screenshots_data.dart';
import 'package:ux_research/src/utilities/index.dart';

class ScreenShotsVM extends GetxController {
  ScreenShotsModel _model;
  ScreenShotsVM({required ScreenShotsModel model}) : _model = model;

  List<ScreenShot> get screenshots {
    return _model.screenShotList;
  }

  void filtredScreenShots() {
    _model.filteredScreenShots();
    update();
  }
}
