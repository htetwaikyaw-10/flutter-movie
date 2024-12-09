import 'package:flutter/material.dart';

import 'package:flutter_movie_application/app/data/categories_movie_model.dart';
import 'package:flutter_movie_application/app/data/color_consts.dart';

import 'package:get/get.dart';

class CategoriesView extends GetView {
  final Genre catgo;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoriesView({
    super.key, 
    required this.catgo, 
    required this.isSelected, 
    required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        height: 40,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected ? ColorConsts.gnavColor : ColorConsts.scaffoldBgColor,
        ),
        child: Center(
          child: Text(
            catgo.name,
            style: TextStyle(color: isSelected ? ColorConsts.featureColor : ColorConsts.primaryColor, // Text color logic
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
