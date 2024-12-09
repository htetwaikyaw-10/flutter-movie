import 'package:flutter/material.dart';
import 'package:flutter_movie_application/app/data/color_consts.dart';

import 'package:get/get.dart';

import '../controllers/search_movie_controller.dart';

class SearchMovieView extends GetView<SearchMovieController> {
  const SearchMovieView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsts.scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: ColorConsts.scaffoldBgColor,
        title: const Text('SearchMovieView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchMovieView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
