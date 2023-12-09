import 'package:flutter/material.dart';

class RecommendationModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;
  //String recipe;
  List<String> ingredients;
  List<String> preparationSteps;

  RecommendationModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    required this.viewIsSelected,
    //required this.recipe,
    required this.ingredients,
    required this.preparationSteps
  });

  static List < RecommendationModel > getRecommendations() {
    List < RecommendationModel > recommendations = [];

    recommendations.add(
      RecommendationModel(
       name: 'Zupa pieczarkowa',
       iconPath: 'assets/icons/soup.svg',
       level: 'Łatwe',
       duration: '25 min',
       calorie: '300Kcal',
       viewIsSelected: true,
       boxColor: Color(0xff9DCEFF),
       //recipe: 'Tutaj wpisz przepis na zupę pieczarkową',
       ingredients: ['500g pieczarek', '1 cebula', '2 ząbki czosnku', '1 łyżka masła', '1 łyżka oleju', '1 łyżka mąki', '1 litr bulionu', 'sól', 'pieprz'],
       preparationSteps: ['Krok 1: Przygotuj składniki', 'Krok 2: Pokrój pieczarki', 'Krok 3: Zeszklij cebulę', 'Krok 4: Dodaj pieczarki', 'Krok 5: Dodaj mąkę', 'Krok 6: Dodaj bulion', 'Krok 7: Gotuj przez 20 minut']
      )
    );

    recommendations.add(
      RecommendationModel(
       name: 'Wege-sałatka',
       iconPath: 'assets/icons/salad.svg',
       level: 'Łatwe',
       duration: '10 min',
       calorie: '230Kcal',
       viewIsSelected: false,
       boxColor: Color(0xffEEA4CE),
       //recipe: 'Tutaj wpisz przepis na sałatkę',
       ingredients: ['1 sałata', '2 pomidory', '1 ogórek', '1 papryka', '1 cebula', 'sól', 'pieprz', 'oliwa z oliwek'],
       preparationSteps: ['Krok 1: Przygotuj składniki', 'Krok 2: Pokrój warzywa', 'Krok 3: Wymieszaj warzywa', 'Krok 4: Dodaj sól, pieprz i oliwę', 'Krok 5: Dokładnie wymieszaj']
      )
    );

    return recommendations;
  }
} 
