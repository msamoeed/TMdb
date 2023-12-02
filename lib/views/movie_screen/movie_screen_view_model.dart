import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterapp/providers/authenticaiton/movie_api_provider.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';


import '../../core/logger.dart';
import '../../models/upcoming_movies.dart';

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


 final getMoviesList= FutureProvider((ref) {
    return ref.watch(movieApiServiceProvider).getAllUpComingMovies();
  });


  AsyncValue<UpComingMovies?> getUpComingMovies(ref) {
    return ref.watch(getMoviesList);
  }  

}
