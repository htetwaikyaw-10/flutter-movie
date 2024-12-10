import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_application/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_movie_application/app/modules/home/views/carousel_card_view.dart';
import 'package:get/get.dart';

class CarouselSliderView extends GetView<HomeController> {
  const CarouselSliderView(this.controller, {super.key, required this.items});

  final List<Map<String, String>> items;
  @override
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CarouselSlider(
        options: CarouselOptions(
          height: 250,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          viewportFraction: 0.8,
          aspectRatio: 16 / 9,
          initialPage: controller.currentImage.value,  
          onPageChanged: (index, reason) {
            controller.currentImage.value = index;  
          },
        ),
        items: items.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return CarouselCardView(
                url: item['url'] ?? '',
                title: item['title'] ?? '',
                subTitle: item['subTitle'] ?? '',
                width: MediaQuery.of(context).size.width,
                height: 250,
              );
            },
          );
        }).toList(),
      );
    });
  }
}

