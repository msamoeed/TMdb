import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterapp/models/movie_genres.dart';
import 'package:flutterapp/providers/authenticaiton/movie_api_provider.dart';
import 'package:flutterapp/src/helpers/helperclasses/movie_nav.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../core/locator.dart';
import '../../core/logger.dart';
import '../../models/upcoming_movies.dart';
import '../movie_details_screen/move_details_view.dart';

// ViewModel for the Movie Screen
class MovieScreenViewModel extends BaseViewModel {
  Logger? log; // Logger instance for logging
  bool isSearchBarOpened = false; // Flag to track the state of the search bar
  bool isTyping = false; // Flag to track whether the user is typing
  late String searchText; // Variable to store the search text
  final NavigationService? _navService = locator<NavigationService>(); // NavigationService instance for navigation

  // Constructor to initialize the logger
  MovieScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  // Method to filter a list of Results based on a search term
  List<Results> searchList(List<Results>? words, String searchTerm) {
    List<Results> result =
        words!.where((Results word) => word.title!.contains(searchTerm)).toList();
    return result;
  }

  // Method to set the editing status and notify listeners
  setEditingStatus(status) {
    isTyping = status;
    notifyListeners();
  }

  // Method to toggle the visibility of the search bar and notify listeners
  toggleSeachBar() {
    isSearchBarOpened = !isSearchBarOpened;
    notifyListeners();
  }

  // FutureProvider to get the list of upcoming movies
  final getMoviesList = FutureProvider((ref) {
    return ref.watch(movieApiServiceProvider).getAllUpComingMovies();
  });

  // Getter for the AsyncValue of upcoming movies
  AsyncValue<UpComingMovies?> getUpComingMovies(ref) {
    return ref.watch(getMoviesList);
  }

  // FutureProvider to get the list of movie genres
  final getMoviesGenresList = FutureProvider((ref) {
    return ref.watch(movieApiServiceProvider).getAllGenres();
  });

  // Getter for the AsyncValue of movie genres
  AsyncValue<MovieGenres?> getMoviesGenres(ref) {
    return ref.watch(getMoviesGenresList);
  }

  // Navigation Related Code

  // Method to navigate to the Movie Details Screen
  navigateToMovieDetailScreen({required Results movie, required List<String> genres} ) {
    _navService!.navigateToView(MovieDetailsScreenView(), arguments: MovieDetails(genres: genres, movie: movie));
  }
}
