
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/views/bottom_bar/bottom_bar_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stacked_services/stacked_services.dart';
import 'boot_loader.dart';
import 'core/router.dart' as router;
import 'i18n/strings.g.dart';
import 'src/helpers/constants/app_themes.dart';

void main() async {
  // runZonedGuarded<Future<void>>(() async {
  //initialize GetStorage
  await GetStorage.init();
  //Setting user theme dark if user-theme value is currently null
  GetStorage().writeIfNull("user-theme", "dark");
  //Setting user language english if user-language value is currently null
  GetStorage().writeIfNull("user-language", "en");
  //Fetching user-language from storage
  var lang = GetStorage().read<String>("user-language");
  //Setting language
  LocaleSettings.setLocaleRaw(lang.toString());
  //Setting firebase-crashlytics
  // FirebasePerformance.instance.setPerformanceCollectionEnabled(true);
  
  await AppBootstrapper.init(
    mainAppWidget: ProviderScope(child: TranslationProvider(child: MyApp())),
    runApp: runApp,
  );

  
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // var isDark = GetStorage().read<String>("user-theme") == "dark";
    

    return ThemeProvider(
        // initTheme: isDark ? AppThemes.darkTheme : AppThemes.mainTheme,
        initTheme: AppThemes.mainTheme,
        builder: (_, theme) {
          return ScreenUtilInit(
            designSize: Size(414, 896),
               splitScreenMode: true,
                 minTextAdapt: true,
            builder: (context, child) => GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  //The Perfect Way
                  FocusManager.instance.primaryFocus!.unfocus();
                }
              },
              child:  MaterialApp(
                  localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  locale: TranslationProvider.of(context).flutterLocale,
                  supportedLocales: [
                    ...['en', 'ur'].map((e) => Locale(e))
                  ],

                  localeListResolutionCallback: (locale, supportedLocales) {
                    for (var supportedLocale in supportedLocales) {
                      if (supportedLocale.languageCode ==
                          locale?.first.languageCode) return supportedLocale;
                    }
                    return Locale("en", "US");
                  },
                  debugShowCheckedModeBanner: false,
                  theme: theme,
                  navigatorKey: StackedService.navigatorKey,
                  onGenerateRoute: router.Router.generateRoute,

                  builder: (context, child) {
                    final mediaQueryData = MediaQuery.of(context);
                    final num scale =
                        mediaQueryData.textScaleFactor.clamp(1.0, 1.3);
                    return MediaQuery(
                      child: child!,
                      data: MediaQuery.of(context)
                          .copyWith(textScaleFactor: scale as double?),
                    );
                  },

               
                  home: BottomBarView(),
                ),
              ),
            
          );
        });
  }
}
