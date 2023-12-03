import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutterapp/core/config.dart';
import 'package:flutterapp/src/helpers/constants/app_colors.dart';
import 'package:flutterapp/src/helpers/constants/app_durations.dart';
import 'package:flutterapp/views/movie_details_screen/movie_details_view_model.dart';
import 'package:flutterapp/widgets/smart_widgets/video_player_widget.dart';
import 'package:stacked/stacked.dart';
import '../../i18n/strings.g.dart';
import '../../src/helpers/constants/app_typography.dart';
import '../../widgets/smart_widgets/movie_button.dart';

class MovieDetailsScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieDetailsScreenViewModel>.reactive(
      builder: (BuildContext context, MovieDetailsScreenViewModel viewModel,
          Widget? _) {
        return viewModel.isVideoPlaying
            ? SafeArea(
                child: MyVideoPlayer(
                movieViewModel: viewModel,
              ))
            : Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  centerTitle: false,
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.textWhiteColor,
                    ),
                  ),
                  title: Text(t.movie_screen.watch,
                      style: AppTypography.darkprimary.label16),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Hero(
                        tag: viewModel.movieDetails.movie.id.toString(),
                        child: Container(
                          height: 530.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: CachedNetworkImageProvider(
                                  '${Config.imageUrl}${(viewModel.movieDetails.movie.posterPath).toString()}'),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${t.movie_detail_screen.releaseDate} ${viewModel.movieDetails.movie.releaseDate}',
                                  style: AppTypography.darkprimary.label16
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: MovieButton(
                                        isTransparent: false,
                                        text: t.movie_detail_screen.getTickets,
                                        onTap: () {})),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 15.h),
                                  child: MovieButton(
                                    isTransparent: true,
                                    onTap: () {
                                      viewModel.playVideo();
                                    },
                                    text: t.movie_detail_screen.watchTrailer,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                t.movie_detail_screen.genres,
                                style: AppTypography.primary.label16
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 70.h,
                                child: AnimationLimiter(
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          viewModel.movieDetails.genres.length,
                                      itemBuilder: (context, count) {
                                        return AnimationConfiguration
                                            .staggeredList(
                                          position: count,
                                          duration:
                                              AppDurations.staggeredAnimation,
                                          child: SlideAnimation(
                                            verticalOffset: 50.0,
                                            child: Center(
                                              child: SizedBox(
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22)),
                                                  color: AppColors
                                                      .appColorsPallet[count],
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15.w,
                                                            vertical: 8.h),
                                                    child: Text(
                                                      viewModel.movieDetails
                                                          .genres[count],
                                                      style: AppTypography
                                                          .darkprimary.label12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                              Divider(
                                endIndent: 10,
                                indent: 10,
                                color: AppColors.lightSkeletonColor,
                              ),
                              Text(
                                t.movie_detail_screen.overview,
                                style: AppTypography.primary.label16
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                viewModel.movieDetails.movie.overview
                                    .toString(),
                                style: AppTypography.darkprimary.label12
                                    .copyWith(
                                        color: AppColors.textLightGreyColor),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
      },
      viewModelBuilder: () => MovieDetailsScreenViewModel(context),
    );
  }
}
