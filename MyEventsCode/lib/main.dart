import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'core/app_export.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());});




}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'makemyevent',
      initialBinding: InitialBindings(),

      getPages: AppRoutes.pages,
    );
  }
}
