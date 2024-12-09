import 'package:get/get.dart';

import '../controllers/google_nav_bar_controller.dart';

class GoogleNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoogleNavBarController>(
      () => GoogleNavBarController(),
    );
  }
}
