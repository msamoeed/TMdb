import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';


import '../../core/logger.dart';

class MovieScreenViewModel extends BaseViewModel {
  Logger? log;
  bool isSearchBarOpened = false;
  MovieScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  toggleSeachBar(){
    isSearchBarOpened = !isSearchBarOpened;
    notifyListeners();

  }
}
