import 'package:get/get.dart';

import '../modules/category_place/bindings/category_place_binding.dart';
import '../modules/category_place/views/category_place_view.dart';
import '../modules/detail_hotel/bindings/detail_hotel_binding.dart';
import '../modules/detail_hotel/views/detail_hotel_view.dart';
import '../modules/detail_itenarary/bindings/detail_itenarary_binding.dart';
import '../modules/detail_itenarary/views/detail_itenarary_view.dart';
import '../modules/detail_place/bindings/detail_place_binding.dart';
import '../modules/detail_place/views/detail_place_view.dart';
import '../modules/detail_restaurant/bindings/detail_restaurant_binding.dart';
import '../modules/detail_restaurant/views/detail_restaurant_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/itinerary/bindings/itinerary_binding.dart';
import '../modules/itinerary/views/itinerary_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/pickLocation/bindings/pick_location_binding.dart';
import '../modules/pickLocation/views/pick_location_view.dart';
import '../modules/pick_city/bindings/pick_city_binding.dart';
import '../modules/pick_city/views/pick_city_view.dart';
import '../modules/pref/bindings/pref_binding.dart';
import '../modules/pref/views/pref_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PREF,
      page: () => const PrefView(),
      binding: PrefBinding(),
    ),
    GetPage(
      name: _Paths.PICK_LOCATION,
      page: () => const PickLocationView(),
      binding: PickLocationBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.ITINERARY,
      page: () => const ItineraryView(),
      binding: ItineraryBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PLACE,
      page: () => const DetailPlaceView(),
      binding: DetailPlaceBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY_PLACE,
      page: () => const CategoryPlaceView(),
      binding: CategoryPlaceBinding(),
    ),
    GetPage(
      name: _Paths.PICK_CITY,
      page: () => const PickCityView(),
      binding: PickCityBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ITENARARY,
      page: () => const DetailItenararyView(),
      binding: DetailItenararyBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_HOTEL,
      page: () => const DetailHotelView(),
      binding: DetailHotelBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_RESTAURANT,
      page: () => const DetailRestaurantView(),
      binding: DetailRestaurantBinding(),
    ),
  ];
}
