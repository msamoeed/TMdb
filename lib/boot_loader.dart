import 'dart:async';

import 'package:clock/clock.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/src/helpers/constants/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';

// Config
import 'core/local/local_hive_service.dart';
import 'core/local/path_provider_service.dart';
import 'core/locator.dart';

/// A wrapper class that contains methods to bootstrap the app launch.
///
/// It initializes the important services at app startup to allow
/// syncronous access to them later on.
  class AppBootstrapper {
    const AppBootstrapper._();

  /// Initializer for important and asyncronous app services
  /// Should be called in main after `WidgetsBinding.FlutterInitialized()`.
  ///
  /// WidgetsFlutterBinding.ensureInitialized();
  /// [mainAppWidget] is the first widget that loads on app startup.
  /// [runApp] is the main app binding method that launches our [mainAppWidget].
  static Future<void> init({
    required Widget mainAppWidget,
    required void Function(Widget) runApp,
  }) async {
    // For preparing the key-value mem cache
    // await KeyValueStorageBase.init();

    
    _initPlatformSpecificDepenedencies(); 

    // For prettyifying console debug messages
    debugPrint = _prettifyDebugPrint;

    
      WidgetsFlutterBinding.ensureInitialized();


   

    // For preparing the error monitoring SDK and loading
    // up the `runApp` method in a guarded zone
    await _setupSentrySDK(runApp, mainAppWidget);

    // Initialize locator
    await LocatorInjector.setUpLocator();
   

    // For preparing the app's theme

    //Setting configration of the snackbar-service
    locator<SnackbarService>().registerSnackbarConfig(SnackbarConfig(
        isDismissible: true,
        borderRadius: 15.0,
        backgroundColor: AppColors.backgroundColor,
        snackPosition: SnackPosition.TOP));

    // For restricting the app to portrait mode only
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static Future<void> _setupSentrySDK(
    void Function(Widget) appRunner,
    Widget app,
  ) async {
        runApp(app);

  }
 
   
   

  static void _initPlatformSpecificDepenedencies() async {

    if(kIsWeb){


    }
    else {
          // For preparing to read application directory paths
    await PathProviderService.init();

    // For preparing to read/write to the local storage
    await LocalDatabaseHiveService.init();



    }
  }

  static void _prettifyDebugPrint(String? message, {int? wrapWidth}) {
    final date = clock.now();
    var msg = '${date.year}/${date.month}/${date.day}';
    msg += ' ${date.hour}:${date.minute}:${date.second}';
    msg += ' $message';
    debugPrintSynchronously(msg, wrapWidth: wrapWidth);
  }
}
