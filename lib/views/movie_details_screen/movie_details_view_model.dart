import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterapp/models/movie_videos.dart';
import 'package:flutterapp/providers/authenticaiton/movie_api_provider.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import '../../core/logger.dart';
import '../../src/helpers/helperclasses/movie_nav.dart';

class MovieDetailsScreenViewModel extends BaseViewModel {
  Logger? log;
  late MovieDetails movieDetails;
  late String movieId;
  bool isVideoPlaying = false;
  var getVideoList;
 
  MovieDetailsScreenViewModel(context) {
   this.log = getLogger(this.runtimeType.toString());
   movieDetails =  ModalRoute.of(context)?.settings.arguments as MovieDetails;
    movieId = movieDetails.movie.id.toString();
   getVideoList= FutureProvider((ref) {
    return ref.watch(movieApiServiceProvider).getVideosForMovie(movieId);
  });
   
  }

 

  playVideo(){
    isVideoPlaying = true;
    notifyListeners();
  }

  stopVideo(){
    isVideoPlaying = false;
    notifyListeners();
  }

 

  AsyncValue<MovieVideos?> getVideos(ref) {
    return ref.watch(getVideoList);
  }

}
