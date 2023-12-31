import 'package:flutter/material.dart';

/// A utility class that holds constants for colors used values
/// throughout the entire app.
/// This class has no constructor and all variables are `static`.
@immutable
class AppColors {
  const AppColors._();

  static const List<Color> primaries = [
    Color.fromARGB(249, 195, 91, 255),
    Color.fromARGB(255, 202, 108, 0),
    Color.fromARGB(255, 255, 39, 39),
    Color.fromARGB(255, 255, 132, 17),
    Color.fromARGB(255, 255, 180, 180),
    Color.fromARGB(255, 43, 206, 255),
    Color.fromARGB(255, 194, 255, 27),
    Color.fromARGB(255, 0, 248, 0),
    Colors.tealAccent,
    Color.fromARGB(255, 255, 70, 132),
    secondaryColor,
    Color.fromARGB(255, 0, 150, 236),
  ];

  //shimmer base color for light theme
  static const Color shimmerBaseColor = Color.fromRGBO(224, 224, 224, 1);

  //shimmer highlight color for light theme
  static const Color shimmerHighlightColor = Color.fromRGBO(245, 245, 245, 1);

  //shimmer base color for dark theme
  static const Color shimmerBaseColorDark = Color.fromRGBO(97, 97, 97, 1);

  //shimmer highlight color for dark theme
  static const Color shimmerHighlightColorDark =
      Color.fromRGBO(158, 158, 158, 1);

  /// The main color used for theming the app.
  static const Color primaryColor = Color(0xFF2E2739);

  //The error color used for error messages.
  static const Color errorColor = Color(0xFFd45050);

  /// The color value for orange color in the app.
  static const Color lightPrimaryColor = Color.fromARGB(250, 186, 67, 255);

  /// The secondary yellowish color used for contrasting
  /// the primary purple in the app.
  static const Color secondaryColor = Color.fromARGB(255, 255, 199, 44);

  /// The tertiary blackish color used for contrasting
  /// the secondary yellow in the app.
  static const Color tertiaryColor = Color.fromARGB(255, 43, 43, 43);

  /// The light greyish color used for background surfaces
  /// of the app like behind scrolling screens or scaffolds etc.
  static const Color lightBackgroundColor =  Color(0xFFF6F6Fa);


  static const Color appBarIconLight = Color.fromRGBO(130, 125, 136, 1);


  /// The darker greyish color used for background surfaces
  /// of the app like behind scrolling screens or scaffolds etc.
  static const Color backgroundColor = Color(0xFFF6F6FA);

  static const Color darkBackgroundColor = Color(0xff242424);

  /// The light greyish color used for container/card surfaces
  /// of the app.
  static const Color surfaceColor = Color.fromARGB(255, 253, 253, 253);

  /// The light greyish color used for filling fields of the app.
  static const Color fieldFillColor = Color(0xFFEAE9EB);

  /// The color value for red color in the app.
  static const Color redColor = Color(0xFFed0000);

  /// The color value for rating stars in the app.
  static const Color starsColor = Color.fromARGB(255, 247, 162, 64);


  /// The color value for divider in the app.
  static const Color dividerColor = Color(0xFF000000);

  /// The color value for dark grey skeleton containers in the app.
  static const Color darkSkeletonColor = Color(0xFF656565);

  /// The color value for light grey skeleton containers in the app.
  static const Color lightSkeletonColor = Colors.grey;

  /// The color value for grey borders in the app.
  static const Color greyOutlineColor = Color.fromARGB(255, 207, 207, 207);

  /// The color value for light grey borders in the app.
  static const Color lightOutlineColor = Color.fromARGB(255, 224, 224, 224);

  /// The red [LinearGradient] for buttons in the app.
  static Gradient buttonGradientRed = LinearGradient(
    colors: [primaryColor, redColor],
  );

  /// The orange [LinearGradient] for buttons in the app.
  static Gradient buttonGradientPurple = LinearGradient(
    colors: [lightPrimaryColor, primaryColor],
  );

  /// The orange [LinearGradient] for disabled buttons in the app.
  static Gradient buttonGradientGrey = LinearGradient(
    colors: [lightSkeletonColor, darkSkeletonColor],
  );

  /// The white [LinearGradient] for fading movies carousel in the app.
  static Gradient movieCarouselGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.3, 0.6, 1],
    colors: [
      Color.fromRGBO(255, 255, 255, 0.95),
      Colors.white70,
      Colors.transparent,
    ],
  );

  /// The black [LinearGradient] used to overlay movie backgrounds in the app.
  static Gradient blackOverlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.2, 0.5, 0.7, 1],
    colors: [
      Color.fromRGBO(0, 0, 0, 0.6),
      Color.fromRGBO(0, 0, 0, 0.45),
      Color.fromRGBO(0, 0, 0, 0.3),
      Colors.transparent,
    ],
  );

    /// The color pallet of the app.
  static List<Color> appColorsPallet = [
    Color.fromRGBO(21, 210, 188, 1),
    Color.fromRGBO(226, 108, 165, 1),
    Color.fromRGBO(86, 76, 163, 1), 
    Color.fromRGBO(205, 157, 15, 1), 
    Color.fromRGBO(97, 195, 242, 1)      ,
   Color.fromRGBO(46, 39, 57, 1),
    Color.fromRGBO(130, 125, 136, 1),
   Color.fromRGBO(219, 219, 223, 1),
    Color.fromRGBO(246, 246, 250, 1)
                           
  ];
  /// The color value for dark grey buttons in the app.
  static const Color buttonGreyColor = Color(0xFF1c1c1c);

  /// The color value for light grey scaffold in the app.
  static const Color scaffoldGreyColor = Color(0xFF2b2b2b);

  /// The color value for grey text in the app.
  static const Color textGreyColor = Colors.black;
  static const Color darkTextGreyColor = Colors.black;

  /// The color value for light grey text in the app.
  static const Color textLightGreyColor = Color.fromRGBO(143, 143, 143, 1);


  /// The color value for dark grey text in the app.
  static const Color textBlackColor = Color.fromARGB(255, 43, 43, 43);

  static const Color textWhiteColor = Colors.white;

  /// The color value for white text in the app.
  static const Color textWhite80Color = Color(0xFFf2f2f2);

  /// The color value for dark grey [CustomDialog] in the app.
  static const Color barrierColor = Colors.black87;

  /// The color value for light grey [CustomDialog] in the app.
  static const Color barrierColorLight = Color(0xBF000000);

  static const neoTopShadowColorLight = Color(0xffd9d9d9);
  static const neoBottomShadowColorLight = Colors.white;

  static const neoTopShadowColorDark = Color(0xff202020);
  static const neoBottomShadowColorDark = Color(0xff282828);

   /// The color value for buttons grey  in the app.
  static const Color buttonColor = Color.fromRGBO(97, 195, 242, 1);

  static const backgroundScaffoldColor = Color(0xffD1E0F4);
  static const tileColor = Color(0xffFFFFFF);
}
