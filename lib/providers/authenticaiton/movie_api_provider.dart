import 'dart:core';

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterapp/models/movie_genres.dart';
import '../../../services/api/api_service.dart';
import '../../core/locator.dart';
import '../../models/movie_videos.dart';
import '../../models/upcoming_movies.dart';
import '../../services/api/api_endpoint.dart';

class MovieApiProviderService {
  final ApiService? _apiService = locator<ApiService>();

  //Get Request To Fetch All Upcoming Movies
  Future<UpComingMovies?> getAllUpComingMovies() async {
    return await _apiService?.getDocumentData<UpComingMovies>(
        requiresApiKey: true,
        cachePolicy: CachePolicy.request,
        endpoint: ApiEndpoint.movies(endpoint: Movies.UPCOMING_MOVIES),
        converter: (response) => UpComingMovies.fromJson(response));
  }

  //Get Request To Fetch All Genres Movies

  Future<MovieGenres?> getAllGenres() async {
    return await _apiService?.getDocumentData<MovieGenres>(
        requiresApiKey: true,
        cachePolicy: CachePolicy.request,
        endpoint: ApiEndpoint.movies(endpoint: Movies.MOVIE_GENRES),
        converter: (response) => MovieGenres.fromJson(response));
  }

  Future<MovieVideos?> getVideosForMovie(String movieId) async {
    return await _apiService?.getDocumentData<MovieVideos>(
        requiresApiKey: true,
        cachePolicy: CachePolicy.request,
        endpoint:
            ApiEndpoint.movies(endpoint: Movies.MOVIE_VIDEOS, payload: movieId),
        converter: (response) => MovieVideos.fromJson(response));
  }
}

final movieApiServiceProvider =
    Provider<MovieApiProviderService>((ref) => MovieApiProviderService());

final movieStateProvider = StateProvider((ref) => UpComingMovies());
final genreStateProvider = StateProvider((ref) => MovieGenres());
