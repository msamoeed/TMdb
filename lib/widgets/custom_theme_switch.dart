import 'package:animated_theme_switcher/animated_theme_switcher.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../src/helpers/constants/app_colors.dart';
import '../src/helpers/constants/app_themes.dart';

class CustomThemeSwitch extends StatelessWidget {
  const CustomThemeSwitch({
    Key? key,
     this.iconSize, this.height,
  }) : super(key: key);

  final double? iconSize;
  final double? height;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var isLight = theme.brightness == Brightness.light;
    return ThemeSwitcher(builder: (context) {
      return Container(
        height: height,
          width: 73,
          decoration: BoxDecoration(
            color: isLight ? const Color(0x1a000000) : const Color(0x1AFFFFFF),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: IconButton(
                    color: !isLight ? Colors.grey : AppColors.primaryColor,
                    icon: Icon(
                      Icons.wb_sunny,
                      size: iconSize,
                    ),
                    onPressed: () {
                      GetStorage().write("user-theme", "light");
                      ThemeSwitcher.of(context)
                          .changeTheme(theme: AppThemes.mainTheme);
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    color: isLight ? Colors.grey : AppColors.primaryColor,
                    icon: Icon(
                      Icons.nightlight_rounded,
                      size: iconSize,
                    ),
                    onPressed: () {
                      GetStorage().write("user-theme", "dark");
                      ThemeSwitcher.of(context)
                          .changeTheme(theme: AppThemes.darkTheme);
                    },
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
