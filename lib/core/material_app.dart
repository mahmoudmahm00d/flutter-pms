import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../screens/unknown_route/unknown_route_screen.dart';
import 'pages.dart';
import 'theme.dart';
import 'constants.dart';
import 'localizations.dart' as locale;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
// Builds the Widget
  Widget build(BuildContext context) {
    // Get the Storage
    var box = GetStorage();
    // Return the Material App
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      title: Constants.applicationTitle,
      translations: locale.Localizations(),
      locale: box.read("locale") == 'ar'
          ? const Locale('ar', 'SY')
          : const Locale('en', 'US'),
      theme: appTheme,
      getPages: pages,
      unknownRoute: GetPage(
        name: '/unknown',
        page: () => const UnknownRouteScreen(),
      ),
      // Check if token is present in storage
      initialRoute: box.read('token') == null ? '/login' : '/dashboard',
    );
  }
}
