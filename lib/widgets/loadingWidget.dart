
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../i18n/strings.g.dart';
import '../src/helpers/constants/app_colors.dart';
import '../src/helpers/constants/app_typography.dart';

class LoadingWidget extends StatelessWidget {
  final bool? isLoading;
  final Widget? child;
  LoadingWidget({this.isLoading, this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingOverlay(
        isLoading: isLoading!,
        progressIndicator: Container(
          height: 100,
          child: Column(
            children: [
              SpinKitWave(
                color: AppColors.primaryColor,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                t.common.pleaseWait,
                style: AppTypography.primary.title18
              )
            ],
          ),
        ),
        color: Colors.black,
        child: child!,
      ),
    );
  }
}
