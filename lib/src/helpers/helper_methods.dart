  import '../../models/movie_genres.dart';
import 'package:flutter/foundation.dart';

/// A utility class that holds helper methods for the app.
/// This class has no constructor and all variables are `static`.
@immutable
class HelperMethods {
  const HelperMethods._();


static List<String> getGenreNamesByIds(List<int>? genreIds, List<Genres>? genres) {
    List<String> genreNames = [];
    for (int genreId in genreIds!) {
      Genres? matchingGenre = genres!.firstWhere(
        (genre) => genre.id == genreId,
       
      );
        genreNames.add(matchingGenre.name!);
      
    }
    return genreNames;
  }
  
}
