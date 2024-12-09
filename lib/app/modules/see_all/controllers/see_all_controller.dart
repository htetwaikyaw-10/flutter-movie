import 'dart:convert';
import 'package:flutter_movie_application/app/data/color_consts.dart';
import 'package:flutter_movie_application/app/data/popular_movie_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SeeAllController extends GetxController {
  //TODO: Implement SeeAllController

  final count = 0.obs;
  var popularmovieList = <PopularMovie>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchPopularMovies();
  }
  Future<void> fetchPopularMovies() async {
    final url = '$baseUrl/movie/popular?api_key=19d6149f34738ec93c495cd0527246ae&language=en-US&page=1';

    try {
      final response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        
        if (jsonData['results'] is List) {
          popularmovieList.value = (jsonData['results'] as List)
              .map((data) => PopularMovie.fromJson(data))
              .toList();
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error fetching categories: $e');
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
