import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterapp/models/movie_genres.dart';
import 'package:flutterapp/providers/authenticaiton/movie_api_provider.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

import '../../core/logger.dart';
import '../../models/upcoming_movies.dart';

class MovieScreenViewModel extends BaseViewModel {
  Logger? log;
  bool isSearchBarOpened = false;
  bool isTyping = false;
 
  late String searchText;
  MovieScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  List<Results> searchList(List<Results>? words, String searchTerm) {
  List<Results> result = words!.where((Results word) => word.title!.contains(searchTerm)).toList();
  return result;
}



  setEditingStatus(status){
    isTyping =  status;
    notifyListeners();
  }

  toggleSeachBar() {
    isSearchBarOpened = !isSearchBarOpened;
    notifyListeners();
  }
  
   final getMoviesList = FutureProvider((ref) {
    return ref.watch(movieApiServiceProvider).getAllUpComingMovies();
  });

  AsyncValue<UpComingMovies?> getUpComingMovies(ref) {
    return ref.watch(getMoviesList);
  }

 

  final getMoviesGenresList = FutureProvider((ref) {
    return ref.watch(movieApiServiceProvider).getAllGenres();
  });


  AsyncValue<MovieGenres?> getMoviesGenres(ref) {
    return ref.watch(getMoviesGenresList);
  }
}
