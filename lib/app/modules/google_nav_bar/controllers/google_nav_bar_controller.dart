import 'package:flutter_movie_application/app/modules/account/controllers/account_controller.dart';
import 'package:flutter_movie_application/app/modules/downloads/controllers/downloads_controller.dart';
import 'package:flutter_movie_application/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_movie_application/app/modules/search_movie/controllers/search_movie_controller.dart';
import 'package:get/get.dart';

class GoogleNavBarController extends GetxController {
  //TODO: Implement GoogleNavBarController

  final count = 0.obs;
  var currentIndex =0.obs;
  @override
  void onInit() {
    super.onInit();
    initializeController(currentIndex.value);
  }
  void initializeController(int index) {
    // Initialize the corresponding controller based on the selected index
    switch (index) {
      case 0:
        Get.put(HomeController());
        break;
      case 1:
        Get.put(SearchMovieController());
        break;
      case 2:
        Get.put(DownloadsController());
        break;
      case 3:
        Get.put(AccountController());
        break;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
