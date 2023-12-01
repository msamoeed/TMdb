
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/src/helpers/constants/app_typography.dart';
import 'package:stacked/stacked.dart';
import 'error_screen_view_model.dart';

class ErrorScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ErrorScreenViewModel>.reactive(
      builder:
          (BuildContext context, ErrorScreenViewModel viewModel, Widget? _) {
        return SizedBox(
          height: 100.h,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset(
                //   AppAssets.error_image,
                //   height: 300.h,
                // ),
                // SizedBox(
                //   height: 50.h,
                // ),
                Text(
                  "We're sorry....",
                  style: AppTypography.primary.subtitle13,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Something went wrong.\nPlease try again',
                  style: AppTypography.primary.subtitle13,
                  textAlign: TextAlign.center,
                ),
                // SizedBox(
                //   height: 50.h,
                // ),
                // AppButtonWidget(
                //   text: 'Try Again',
                //   height: 200.h,
                //   width: 180.w,
                //   shadowColor: AppColors.errorColor.withOpacity(0.4),
                //   backgroundColor: AppColors.errorColor,
                //   onPressed: () => Navigator.pop(context),
                // )
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => ErrorScreenViewModel(),
    );
  }
}
