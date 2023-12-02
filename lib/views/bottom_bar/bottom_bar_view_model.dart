import 'package:flutterapp/core/logger.dart';
import 'package:flutterapp/views/movie_screen/movie_screen_view.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

class BottomBarViewModel extends IndexTrackingViewModel {
  Logger? log;

  BottomBarViewModel() {
    log = getLogger(this.runtimeType.toString());
  }

  getViewForIndex(int index) {
    if (index == 0) {
      return MovieScreenView();
    } else if (index == 1) {
      return MovieScreenView();
    } else if (index == 2) {
      return MovieScreenView();
    }
     else if (index == 3) {
      return MovieScreenView();
    }
     else {
      return MovieScreenView();
    }
  }
}
