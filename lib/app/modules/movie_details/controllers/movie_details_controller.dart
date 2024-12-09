import 'dart:convert';

import 'package:flutter_movie_application/app/data/color_consts.dart';
import 'package:flutter_movie_application/app/data/movie_detail_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class MovieDetailsController extends GetxController {
  //TODO: Implement MovieDetailsController
  var movieId = Get.arguments;
  final isLoading = false.obs;
  final count = 0.obs;
  final movieDetails = Rxn<MovieDetail>();
  @override
  void onInit() {
    super.onInit();
    fetchMovieDetails();
  }
  Future<void> fetchMovieDetails() async {
    final url = '$baseUrl/movie/$movieId?api_key=19d6149f34738ec93c495cd0527246ae&language=en-US&page=1';
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        
        movieDetails.value = MovieDetail.fromJson(jsonData); 
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
    finally {
      isLoading.value = false; 
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
