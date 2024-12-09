import 'package:flutter/material.dart';
import 'package:flutter_movie_application/app/data/color_consts.dart';

import 'package:get/get.dart';

import '../controllers/downloads_controller.dart';

class DownloadsView extends GetView<DownloadsController> {
  const DownloadsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsts.scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: ColorConsts.scaffoldBgColor,
        title: const Text('DownloadsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DownloadsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
