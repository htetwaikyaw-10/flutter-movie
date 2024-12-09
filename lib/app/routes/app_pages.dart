import 'package:get/get.dart';

import '../modules/account/bindings/account_binding.dart';
import '../modules/account/views/account_view.dart';
import '../modules/downloads/bindings/downloads_binding.dart';
import '../modules/downloads/views/downloads_view.dart';
import '../modules/google_nav_bar/bindings/google_nav_bar_binding.dart';
import '../modules/google_nav_bar/views/google_nav_bar_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/movie_details/bindings/movie_details_binding.dart';
import '../modules/movie_details/views/movie_details_view.dart';
import '../modules/search_movie/bindings/search_movie_binding.dart';
import '../modules/search_movie/views/search_movie_view.dart';
import '../modules/see_all/bindings/see_all_binding.dart';
import '../modules/see_all/views/see_all_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.GOOGLE_NAV_BAR;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.GOOGLE_NAV_BAR,
      page: () => const GoogleNavBarView(),
      binding: GoogleNavBarBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_MOVIE,
      page: () => const SearchMovieView(),
      binding: SearchMovieBinding(),
    ),
    GetPage(
      name: _Paths.DOWNLOADS,
      page: () => const DownloadsView(),
      binding: DownloadsBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.SEE_ALL,
      page: () => const SeeAllView(),
      binding: SeeAllBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE_DETAILS,
      page: () => const MovieDetailsView(),
      binding: MovieDetailsBinding(),
    ),
  ];
}
