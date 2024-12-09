import 'package:flutter/material.dart';
import 'package:flutter_movie_application/app/data/color_consts.dart';

import 'package:flutter_movie_application/app/data/popular_movie_model.dart';

import 'package:get/get.dart';

class RecommendedCardView extends GetView {
  final PopularMovie movie;
  const RecommendedCardView({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => Get.toNamed('/movie-details', arguments: movie.id),
          child: Container(
            width: 180,
            decoration: BoxDecoration(
              color: ColorConsts.gnavColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 0, left: 6),
                  child: Text(
                    movie.title,
                    style: TextStyle(
                        color: ColorConsts.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 10, left: 6),
                  child: Text(
                    movie.releaseDate,
                    style: TextStyle(
                      color: ColorConsts.secondaryColor,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 8,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorConsts.gnavColor),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: ColorConsts.ratingColor,
                  size: 14,
                ),
                const SizedBox(width: 6),
                Text(
                  movie.voteAverage.toString(),
                  style:
                      TextStyle(color: ColorConsts.ratingColor, fontSize: 14),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
