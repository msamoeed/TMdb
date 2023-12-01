import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';


import '../../core/logger.dart';

class ErrorScreenViewModel extends BaseViewModel {
  Logger? log;

  ErrorScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
