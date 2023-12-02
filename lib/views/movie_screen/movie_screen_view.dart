import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/src/helpers/constants/app_colors.dart';
import 'package:flutterapp/src/helpers/constants/app_durations.dart';
import 'package:flutterapp/src/helpers/constants/app_typography.dart';
import 'package:stacked/stacked.dart';

import '../../i18n/strings.g.dart';
import 'movie_screen_view_model.dart';

class MovieScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.search),
                                  SizedBox(
                                    width: 250.w,
                                    child: TextField(
                                      decoration: InputDecoration.collapsed(
                                          hintText:t.movie_screen.searchHint),
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
                        padding: EdgeInsets.only(right: 10.w),
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
        );
      },
      viewModelBuilder: () => MovieScreenViewModel(),
    );
  }
}
