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
  final double height;
  final Results movie;
  final bool isHorizontal;
  final MovieScreenViewModel viewModel;

  MovieCard(
      {super.key,
      required this.height,
      required this.movie,
      required this.isHorizontal,
      required this.viewModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return isHorizontal
        ? viewModel.getMoviesGenres(ref).when(
            data: (data) => Container(
                  height: height,
                  child: Row(
                    children: [
                      Expanded(
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
                      )),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  movie.title.toString(),
                                  style: AppTypography.primary.title18,
                                ),
                                Text(
                                  HelperMethods.getGenreNamesByIds(
                                          movie.genreIds, data!.genres)
                                      .toList()
                                      .first,
                                  style: AppTypography.primary.label12.copyWith(
                                      color: AppColors.lightSkeletonColor),
                                )
                                // Text(movie.ge)
                              ],
                            ),
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            color: AppColors.buttonColor,
                            size: 28,
                          ))
                    ],
                  ),
                ),
            error: (error, stack) => Text("Error"),
            loading: () => Center(
                  child: Container(),
                ))
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
                padding: const EdgeInsets.all(15),
                child: Text(
                  (movie.title).toString(),
                  style: AppTypography.darkprimary.title18,
                ),
              ),
            ) // Foreground widget here
            );
  }
}
