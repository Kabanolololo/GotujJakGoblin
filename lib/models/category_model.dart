import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconpath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconpath,
    required this.boxColor
  });

  static List<CategoryModel> getCategories(){
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Kurczak',
        iconpath: 'assets/icons/chicken.svg', 
        boxColor: Color.fromARGB(255, 194, 68, 68)
        )
    );
    categories.add(
      CategoryModel(
        name: 'Makaron',
        iconpath: 'assets/icons/pasta.svg', 
        boxColor: Color.fromARGB(255, 243, 222, 35)
        )
    );
    categories.add(
      CategoryModel(
        name: 'Ryż',
        iconpath: 'assets/icons/rice.svg', 
        boxColor: Color.fromARGB(255, 126, 148, 123)
        )
    );
    return categories;
  }
}