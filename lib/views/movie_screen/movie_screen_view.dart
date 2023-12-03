import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutterapp/src/helpers/constants/app_colors.dart';
import 'package:flutterapp/src/helpers/constants/app_durations.dart';
import 'package:flutterapp/src/helpers/constants/app_typography.dart';
import 'package:flutterapp/widgets/smart_widgets/shimmer_card.dart';
import 'package:stacked/stacked.dart';
import '../../i18n/strings.g.dart';
import '../../widgets/smart_widgets/movie_card.dart';
import 'movie_screen_view_model.dart';

// Main widget for the Movie Screen
class MovieScreenView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Reactively build the widget based on the view model
    return ViewModelBuilder<MovieScreenViewModel>.reactive(
      builder:
          (BuildContext context, MovieScreenViewModel viewModel, Widget? _) {
        // Scaffold widget as the main container
        return viewModel.getMoviesGenres(ref).isRefreshing
            ? CircularProgressIndicator()
            : Scaffold(
                backgroundColor: AppColors.backgroundColor,
                appBar: PreferredSize(
                  preferredSize: Size(ScreenUtil().scaleWidth,
                      viewModel.isSearchBarOpened ? 80.h : 60.h),
                  // App bar containing title or search bar based on the state
                  child: AppBar(
                    centerTitle: false,
                    title: AnimatedSwitcher(
                        duration: AppDurations.animatedSwitcher,
                        child: !viewModel.isSearchBarOpened
                            ? Text(t.movie_screen.watch,
                                style: AppTypography.primary.label16)
                            : Container(
                                // Search bar UI when opened
                                height: 52.h,
                                width: 400.w,
                                decoration: BoxDecoration(
                                  color: AppColors.fieldFillColor,
                                  borderRadius: BorderRadius.circular(33),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.search),
                                        SizedBox(
                                          width: 250.w,
                                          child: TextField(
                                            onChanged: (value) {
                                              viewModel.searchText = value;
                                              viewModel.setEditingStatus(true);
                                            },
                                            onEditingComplete: () {},
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText:
                                                  t.movie_screen.searchHint,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.cancel_sharp),
                                          onPressed: () {
                                            viewModel.toggleSeachBar();
                                            viewModel.setEditingStatus(false);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                    backgroundColor: AppColors.textWhiteColor,
                    actions: [
                      !viewModel.isSearchBarOpened
                          ? Padding(
                              padding: EdgeInsets.only(right: 20.w),
                              child: IconButton(
                                icon: Icon(Icons.search),
                                onPressed: () {
                                  viewModel.toggleSeachBar();
                                },
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
                body: viewModel.getUpComingMovies(ref).when(
                      data: (data) => AnimatedSwitcher(
                        duration: AppDurations.animatedSwitcher,
                        // Body containing movie list, either ListView or GridView
                        child: Padding(
                          padding: EdgeInsets.only(top: 15.h),
                          child: !viewModel.isSearchBarOpened ||
                                  viewModel.isTyping
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    viewModel.isSearchBarOpened &&
                                            viewModel.isTyping
                                        ? Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 25.w),
                                            child: Text(
                                              t.movie_screen.topResults,
                                              style: AppTypography
                                                  .primary.label12
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w800),
                                            ),
                                          )
                                        : Container(),
                                    viewModel.isSearchBarOpened &&
                                            viewModel.isTyping
                                        ? Divider(
                                            indent: 20,
                                            endIndent: 20,
                                            color: AppColors.dividerColor,
                                          )
                                        : Container(),
                                    Flexible(
                                      child: AnimationLimiter(
                                        child: ListView.builder(
                                          itemCount: viewModel.isTyping
                                              ? viewModel
                                                  .searchList(data!.results,
                                                      viewModel.searchText)
                                                  .length
                                              : data!.results!.length,
                                          itemBuilder: (context, count) {
                                            // Display either search result or regular MovieCard
                                            return AnimationConfiguration
                                                .staggeredList(
                                              duration: AppDurations
                                                  .staggeredAnimation,
                                              position: count,
                                              child: SlideAnimation(
                                                verticalOffset: 50.0,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  child: viewModel.isTyping
                                                      ? MovieCard(
                                                          viewModel: viewModel,
                                                          height: 140,
                                                          movie: viewModel.searchList(
                                                                  data.results,
                                                                  viewModel
                                                                      .searchText)[
                                                              count],
                                                          isHorizontal: true,
                                                        )
                                                      : MovieCard(
                                                          viewModel: viewModel,
                                                          height: 180,
                                                          movie: data
                                                              .results![count],
                                                          isHorizontal: false,
                                                        ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : AnimationLimiter(
                                  child: GridView.builder(
                                    itemCount: data!.results!.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 1.1),
                                    itemBuilder: (context, count) {
                                      // Display MovieCard in a grid view
                                      return AnimationConfiguration
                                          .staggeredGrid(
                                        columnCount: 2,
                                        position: count,
                                        duration:
                                            AppDurations.staggeredAnimation,
                                        child: FadeInAnimation(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: MovieCard(
                                              viewModel: viewModel,
                                              height: 50.h,
                                              movie: data.results![count],
                                              isHorizontal: false,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ),
                      ),
                      error: (error, stack) => Text(error.toString()),
                      loading: () => ShimmerCard(),
                    ),
              );
      },
      viewModelBuilder: () => MovieScreenViewModel(),
    );
  }
}
