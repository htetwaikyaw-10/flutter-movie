import 'package:flutter/material.dart';
import 'package:flutter_movie_application/app/data/color_consts.dart';
import 'package:flutter_movie_application/app/modules/home/views/carousel_slider_view.dart';
import 'package:flutter_movie_application/app/modules/home/views/categories_view.dart';
import 'package:flutter_movie_application/app/modules/home/views/recommended_card_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    List<Map<String, String>> items = [
      {
        'url':
            'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a364ee04-6380-4393-a551-2199250f57bf/dbtspza-04318586-4f6e-4363-b1b9-b9f285b1d475.jpg/v1/fill/w_1024,h_626,q_75,strp/the_avengers___wallpaper_by_daviddv1202_dbtspza-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjI2IiwicGF0aCI6IlwvZlwvYTM2NGVlMDQtNjM4MC00MzkzLWE1NTEtMjE5OTI1MGY1N2JmXC9kYnRzcHphLTA0MzE4NTg2LTRmNmUtNDM2My1iMWI5LWI5ZjI4NWIxZDQ3NS5qcGciLCJ3aWR0aCI6Ijw9MTAyNCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.D1AUjxXBzPIp_-Wq458tK5qIbcHjfuIW0C7sBpyYNx4',
        'title': 'Avangers: End Game',
        'subTitle': 'Action',
      },
      {
        'url':
            'https://m.media-amazon.com/images/I/81PwKpTI1BL._AC_UF1000,1000_QL80_.jpg',
        'title': 'Transformer: Rise of the beasts',
        'subTitle': 'Action',
      },
      {
        'url':
            'https://m.media-amazon.com/images/M/MV5BODJkMTQ5ZmQtNzQxYy00ZWNlLWI0ZGYtYjU1NzdiMjcyNDRmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
        'title': 'Fast and furious 9',
        'subTitle': 'Action',
      },
    ];
    return Scaffold(
      backgroundColor: ColorConsts.scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: ColorConsts.scaffoldBgColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: GFAvatar(
            backgroundImage: AssetImage('assets/human.jpg'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello, Smith',
              style: TextStyle(
                  color: ColorConsts.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Let's stream your favourite movie",
              style: TextStyle(color: ColorConsts.secondaryColor, fontSize: 15),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: ColorConsts.gnavColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              cursorColor: ColorConsts.secondaryColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorConsts.gnavColor,
                hintText: 'Search a title...',
                hintStyle: TextStyle(color: ColorConsts.secondaryColor),
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorConsts.secondaryColor,
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
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
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSliderView(controller, items: items),
                  const SizedBox(height: 10),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        items.length,
                        (index) =>
                            buildDot(index, controller.currentImage.value),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      children: [
                        Text(
                          'Recommended for you',
                          style: TextStyle(
                              color: ColorConsts.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Get.toNamed('/see-all'),
                          child: Text(
                            'See All',
                            style: TextStyle(
                              color: ColorConsts.featureColor,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(() {
                    return SizedBox(
                      height: 280,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.popularmovieList.length,
                          itemBuilder: (context, index) {
                            final movie = controller.popularmovieList[index];
                            return Padding(
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              child: RecommendedCardView(movie: movie),
                            );
                          },
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                              color: ColorConsts.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(() {
                    return SizedBox(
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categories.length,
                          itemBuilder: (context, index) {
                            final catgory = controller.categories[index];
                            final isSelected =
                                index == controller.selectedCategoryIndex.value;
                            return Padding(
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              child: CategoriesView(
                                catgo: catgory,
                                isSelected: isSelected,
                                onTap: () => controller.selectCategory(index),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 10),
                  Obx(() {
                    return SizedBox(
                      height: 280,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.popularmovieList.length,
                          itemBuilder: (context, index) {
                            final movie = controller.popularmovieList[index];
                            return Padding(
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              child: RecommendedCardView(movie: movie),
                            );
                          },
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildDot(int index, int currentPage) {
  return Container(
    height: 10.0,
    width: currentPage == index ? 30 : 10,
    margin: const EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: const Color.fromARGB(255, 35, 237, 241),
    ),
  );
}
