import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/core/config.dart';
import 'package:flutterapp/src/helpers/constants/app_typography.dart';

import '../../models/upcoming_movies.dart';

class MovieCard extends StatelessWidget {
  final double height;
  final Results movie;

  const MovieCard({super.key, required this.height, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              style: AppTypography.primary.title18,
            ),
          ),
        ) // Foreground widget here
        );
  }
}
