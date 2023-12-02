import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/src/helpers/constants/app_colors.dart';
import 'package:flutterapp/src/helpers/constants/app_durations.dart';
import 'package:flutterapp/src/helpers/constants/app_typography.dart';
import 'package:stacked/stacked.dart';

import '../../core/config.dart';
import '../../i18n/strings.g.dart';
import '../../widgets/smart_widgets/movie_card.dart';
import 'movie_screen_view_model.dart';

class MovieScreenView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ViewModelBuilder<MovieScreenViewModel>.reactive(
      builder:
          (BuildContext context, MovieScreenViewModel viewModel, Widget? _) {
        return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: PreferredSize(
              preferredSize: Size(ScreenUtil().scaleWidth,
                  viewModel.isSearchBarOpened ? 80.h : 60.h),
              child: AppBar(
                centerTitle: false,
                title: AnimatedSwitcher(
                    duration: AppDurations.animatedSwitcher,
                    //Transactioning between openSearchBar and cLosedOne
                    child: !viewModel.isSearchBarOpened
                        ? Text(t.movie_screen.watch,
                            style: AppTypography.primary.label16)
                        : Container(
                            height: 52.h,
                            width: 400.w,
                            decoration: BoxDecoration(
                              color: AppColors.fieldFillColor,
                              borderRadius: BorderRadius.circular(33),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.search),
                                    SizedBox(
                                      width: 250.w,
                                      child: TextField(
                                        decoration: InputDecoration.collapsed(
                                            hintText:
                                                t.movie_screen.searchHint),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.cancel_sharp),
                                      onPressed: () {
                                        viewModel.toggleSeachBar();
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
                      
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: !viewModel.isSearchBarOpened
                            ? ListView.builder(
                                itemCount: data!.results!.length,
                                itemBuilder: (context, count) {
                                  return Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: MovieCard(height: 180,movie: data.results![count],),
                                  );
                                })
                            : GridView.builder(
                                itemCount: data!.results!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (context, count) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MovieCard(height: 50.h,movie: data.results![count]),
                                  );
                                },
                              ),
                      ),
                    ),
                error: (error, stack) => Text(error.toString()),
                loading: () => Center(child: CircularProgressIndicator())));
      },
      viewModelBuilder: () => MovieScreenViewModel(),
    );
  }
}
