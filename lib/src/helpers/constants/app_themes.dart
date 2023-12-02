import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Helpers
import 'app_colors.dart';
import 'app_typography.dart';

/// A utility class that holds themes for the app. It controls
/// how the app looks on different platforms like android, ios etc.
///
/// This class has no constructor and all methods are `static`.
@immutable
class AppThemes {
  const AppThemes._();

  /// The main starting theme for the app.
  ///
  /// Sets the following defaults:
  /// * primaryColor: [AppColors.primaryColor],
  ///
  /// * fontFamily: [AppTypography.primary].fontFamily,
  ///
  /// * textTheme: [AppTypography.primary].textTheme
  ///
  /// * iconTheme: [Colors.white] for default icon
  ///
  /// * textButtonTheme: [TextButtonTheme] without the default padding,
  static final mainTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.backgroundColor,
      titleTextStyle: AppTypography.primary.heading22,
      iconTheme: const IconThemeData(color: AppColors.primaryColor),
    ),
    iconTheme: const IconThemeData(color: AppColors.textLightGreyColor),
  );

  //Dark Theme
  static final darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    textTheme: AppTypography.darkprimary.textTheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.darkBackgroundColor,
      titleTextStyle: AppTypography.primary.heading22,
      iconTheme: const IconThemeData(color: AppColors.primaryColor),
    ),
    iconTheme: const IconThemeData(color: AppColors.textLightGreyColor),
  );
}
