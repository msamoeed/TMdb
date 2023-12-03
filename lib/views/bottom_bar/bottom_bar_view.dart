import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/src/helpers/constants/app_typography.dart';
import 'package:stacked/stacked.dart';
import '../../src/helpers/constants/app_colors.dart';
import 'bottom_bar_view_model.dart';

class BottomBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomBarViewModel>.reactive(
      builder: (BuildContext context, BottomBarViewModel viewModel, Widget? _) {
        return Scaffold(
          body: viewModel.getViewForIndex(viewModel.currentIndex),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.r),
                  topLeft: Radius.circular(30.r)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.r),
                topLeft: Radius.circular(30.r),
              ),
              child: BottomNavigationBar(
                onTap: (val) => viewModel.setIndex(val),
                type: BottomNavigationBarType.fixed,
                //add background color
                selectedLabelStyle: AppTypography.darkprimary.label11,
                unselectedLabelStyle: AppTypography.darkprimary.label11
                    .copyWith(color: AppColors.appBarIconLight),
                backgroundColor: AppColors.primaryColor,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      EvaIcons.home,
                      color: AppColors.appBarIconLight,
                    ),
                    activeIcon: Icon(
                      EvaIcons.home,
                      color: AppColors.textWhiteColor,
                    ),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      EvaIcons.playCircle,
                      color: AppColors.appBarIconLight,
                    ),
                    activeIcon: Icon(
                      EvaIcons.playCircle,
                      color: AppColors.textWhiteColor,
                    ),
                    label: 'Watch',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.library_add,
                      color: AppColors.appBarIconLight,
                    ),
                    activeIcon: Icon(
                      Icons.library_add,
                      color: AppColors.textWhiteColor,
                    ),
                    label: 'Media Library',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      EvaIcons.moreHorizontal,
                      color: AppColors.appBarIconLight,
                    ),
                    activeIcon: Icon(
                      EvaIcons.moreHorizontal,
                      color: AppColors.textWhiteColor,
                    ),
                    label: 'More',
                  ),
                ],
                currentIndex: viewModel.currentIndex,
                selectedItemColor: Colors.white,
              ),
            ),
          ),
        );
        // );
      },
      viewModelBuilder: () => BottomBarViewModel(),
    );
  }
}
