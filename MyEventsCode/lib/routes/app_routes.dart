import 'package:makemyevent/presentation/home_page_screen/home_page_screen.dart';
import 'package:makemyevent/presentation/home_page_screen/binding/home_page_binding.dart';
import 'package:makemyevent/presentation/fashion_event_one_screen/fashion_event_one_screen.dart';
import 'package:makemyevent/presentation/fashion_event_one_screen/binding/fashion_event_one_binding.dart';
import 'package:makemyevent/presentation/fashion_event_screen/fashion_event_screen.dart';
import 'package:makemyevent/presentation/fashion_event_screen/binding/fashion_event_binding.dart';
import 'package:makemyevent/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:makemyevent/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String homePageScreen = '/home_page_screen';

  static const String fashionEventOneScreen = '/fashion_event_one_screen';

  static const String fashionEventScreen = '/fashion_event_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: homePageScreen,
      page: () => HomePageScreen(),
      bindings: [
        HomePageBinding(),
      ],
    ),
    GetPage(
      name: fashionEventOneScreen,
      page: () => FashionEventOneScreen(),
      bindings: [
        FashionEventOneBinding(),
      ],
    ),
    GetPage(
      name: fashionEventScreen,
      page: () => FashionEventScreen(),
      bindings: [
        FashionEventBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => HomePageScreen(),
      bindings: [
        HomePageBinding(),
      ],
    )
  ];
}
