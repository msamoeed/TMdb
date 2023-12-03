import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/core/config.dart';
import 'package:flutterapp/src/helpers/constants/app_colors.dart';
import 'package:flutterapp/src/helpers/constants/app_typography.dart';
import 'package:flutterapp/src/helpers/helper_methods.dart';
import '../../models/upcoming_movies.dart';
import '../../views/movie_screen/movie_screen_view_model.dart';

class MovieCard extends ConsumerWidget {
  // The height of the movie card
  final double height;
  // The movie data for the card
  final Results movie;
  // Flag to determine if the card should be displayed horizontally or not
  final bool isHorizontal;
  // ViewModel for movie-related operations
  final MovieScreenViewModel viewModel;

  // Constructor for the MovieCard widget
  MovieCard({
    super.key,
    required this.height,
    required this.movie,
    required this.isHorizontal,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late List<String> genres = [];
    // Check if the card is horizontal or not
    return GestureDetector(
      onTap: () =>
          viewModel.navigateToMovieDetailScreen(genres: genres, movie: movie),
      child: isHorizontal
          ? viewModel.getMoviesGenres(ref).when(
                // If data is available
                data: (data) {
                  genres = HelperMethods.getGenreNamesByIds(
                      movie.genreIds, data!.genres);
                  return Container(
                    height: height,
                    child: Row(
                      children: [
                        // Left side with movie poster
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(15.r),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: CachedNetworkImageProvider(
                                    '${Config.imageUrl}${(movie.posterPath).toString()}'),
                              ),
                            ),
                          ),
                        ),
                        // Right side with movie details
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Movie title
                                Text(
                                  movie.title.toString(),
                                  style: AppTypography.primary.title18
                                      .copyWith(fontWeight: FontWeight.w800),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                // First genre name
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  genres.toList().first,
                                  style: AppTypography.primary.label12.copyWith(
                                      color: AppColors.lightSkeletonColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // More options button
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            color: AppColors.buttonColor,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                // If there is an error fetching data
                error: (error, stack) => Text("Error"),
                // While data is still loading
                loading: () => Center(
                  child: Container(),
                ),
              )
          // If the card is not horizontal
          : Container(
              height: height,
              width: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: CachedNetworkImageProvider(
                      '${Config.imageUrl}${(movie.posterPath).toString()}'),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    (movie.title).toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppTypography.darkprimary.title18
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
    ); // Foreground widget here
  }
}
