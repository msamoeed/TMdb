import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterapp/providers/authenticaiton/movie_api_provider.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import '../../core/logger.dart';
import '../../models/upcoming_movies.dart';
import '../../src/helpers/helperclasses/movie_nav.dart';

class MovieDetailsScreenViewModel extends BaseViewModel {
  Logger? log;
  late MovieDetails movieDetails;
 
  MovieDetailsScreenViewModel(context) {
   this.log = getLogger(this.runtimeType.toString());
   movieDetails =  ModalRoute.of(context)?.settings.arguments as MovieDetails;
   
  }

  
  
   final getMoviesList = FutureProvider((ref) {
    return ref.watch(movieApiServiceProvider).getAllUpComingMovies();
  });

  AsyncValue<UpComingMovies?> getUpComingMovies(ref) {
    return ref.watch(getMoviesList);
  }

}
