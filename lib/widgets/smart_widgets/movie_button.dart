import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/i18n/strings.g.dart';

import '../../src/helpers/constants/app_colors.dart';
import '../../src/helpers/constants/app_typography.dart';

class MovieButton extends StatelessWidget {
  final bool isTransparent;
  final String text;
  final Function onTap;
  const MovieButton({
    super.key, required this.isTransparent, required this.text, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70.h,
        width: 250.w,
        child: Card(
          color: isTransparent? Colors.transparent : AppColors.buttonColor,
          shape: RoundedRectangleBorder(
              side:
                  BorderSide(color: AppColors.buttonColor),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.play_arrow,
                color: AppColors.textWhiteColor,
              ),
              Text(
                t.movie_detail_screen.watchTrailer,
                style: AppTypography.darkprimary.label16
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          )),
        ));
  }
}