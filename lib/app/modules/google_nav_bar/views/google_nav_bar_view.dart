import 'package:flutter/material.dart';
import 'package:flutter_movie_application/app/data/color_consts.dart';
import 'package:flutter_movie_application/app/modules/account/views/account_view.dart';
import 'package:flutter_movie_application/app/modules/downloads/views/downloads_view.dart';
import 'package:flutter_movie_application/app/modules/home/views/home_view.dart';
import 'package:flutter_movie_application/app/modules/search_movie/views/search_movie_view.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../controllers/google_nav_bar_controller.dart';

class GoogleNavBarView extends GetView<GoogleNavBarController> {
  const GoogleNavBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return Container(
          color: ColorConsts.scaffoldBgColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GNav(
              activeColor: ColorConsts.featureColor,
              color: ColorConsts.secondaryColor,
              tabBackgroundColor: ColorConsts.gnavColor,
              tabBorderRadius: 18,
              padding: EdgeInsets.all(16),
              gap: 10,
              tabs: [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.search, text: 'Search'),
                GButton(icon: Icons.download, text: 'Downloads'),
                GButton(icon: Icons.person, text: 'Account'),
              ],
              selectedIndex: controller.currentIndex.value,
              onTabChange: (index) {
                controller.currentIndex.value = index;
                controller.initializeController(index);
              },
            ),
          ),
        );
      }),
      body: Obx(
        () {
          return IndexedStack(
            index: controller.currentIndex.value,
            children: [
              HomeView(),
              SearchMovieView(),
              DownloadsView(),
              AccountView(),
            ],
          );
        },
      ),
    );
  }
}
