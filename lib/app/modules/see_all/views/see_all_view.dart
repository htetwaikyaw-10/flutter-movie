import 'package:flutter/material.dart';
import 'package:flutter_movie_application/app/data/color_consts.dart';
import 'package:flutter_movie_application/app/modules/home/views/widget/recommended_card_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/see_all_controller.dart';

class SeeAllView extends GetView<SeeAllController> {
  const SeeAllView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsts.scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: ColorConsts.scaffoldBgColor,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: ColorConsts.primaryColor,
            )),
        title: const Text(
          'Recommended movies for you',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorConsts.primaryColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorConsts.gnavColor,
                hintText: "Search a title...",
                hintStyle: const TextStyle(color: ColorConsts.secondaryColor),
                prefixIcon:
                    const Icon(Icons.search, color: ColorConsts.secondaryColor),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 25,
                      child: VerticalDivider(
                        color: ColorConsts.secondaryColor,
                        thickness: 2,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/filter.svg',
                      width: 25,
                    )
                  ],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(
              () {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.63,
                    ),
                    itemCount: controller.popularmovieList.length,
                    itemBuilder: (context, index) {
                      final movie = controller.popularmovieList[index];
                      return RecommendedCardView(movie: movie);
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
