import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projektzaliczenie/models/category_model.dart';
import 'package:projektzaliczenie/models/recomandations.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<RecommendationModel> recommendations = [];

  void _getRecommendations(){
    recommendations = RecommendationModel.getRecommendations();
  }

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    recommendations = RecommendationModel.getRecommendations();
  }

  void _getCategories() {
    categories = CategoryModel.getCategories();
    
  }
  @override
  void initState() {
    _getCategories();
  }
  
  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    _getCategories();
    return Scaffold(
      appBar: AppBar(
        title: Text('Gotuj Jak Goblin 👽',style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        elevation: 0.0,
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, left: 20, right: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xff101617).withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0.0
                )
              ]
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(15),
                hintText: 'Szukaj przepisu...',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Color(0xffDDDADA),
              ),
                prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Search.svg'),
              ),
              suffixIcon: Container(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset('assets/icons/Filter.svg'),
                    )
                  ],
                ),
              ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none
                )
              ),
            ),
          ),
          SizedBox(height: 40,),
          Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left:25),
                child: Text(
                  'Kategorie',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Container(
          height: 150,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(
              left: 20,
              right: 20
            ),
            separatorBuilder: (context, index) => SizedBox(width: 25,),
            itemBuilder: (context, index,) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(categories[index].iconpath),
                      ) 
                    ),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 14
                      )
                    )
                  ]
                ),
              );
            },
          ),
        ),
         SizedBox(height: 40,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left:25),
                child: Text(
                  'Polecane\n Dla ciebie',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
Container(
  //color: Colors.blue,
  height: 240,
  child: ListView.separated(
    itemBuilder: (context, index){
      return Container(
        width: 210,
        decoration: BoxDecoration(
          color: recommendations[index].boxColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.0),  // Dodaj padding z góry o 10 jednostek
              child: SvgPicture.asset(
                recommendations[index].iconPath,
                height: 100,
                width: 100,
              ),
            ),
            Text(
              recommendations[index].name,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Text(
              recommendations[index].level + ' | '+ recommendations[index].duration + ' | ' + recommendations[index].calorie,
              style: TextStyle(
                color: Color(0xff786F72),
                fontSize: 13,
                fontWeight: FontWeight.w400
              ), 
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text('Gotuj Jak Goblin 👽',style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        backgroundColor: Colors.green,
                        elevation: 0.0,
                        centerTitle: true,
                      ),
                      body: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20,),
                            Text(
                              recommendations[index].name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text(
                              'Składniki 🍽️:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              recommendations[index].ingredients.join(',\n'),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text(
                              'Sposób przygotowania 👩‍🍳:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              recommendations[index].preparationSteps.join(',\n'),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                height: 45,
                width: 130,
                child:  Center(
                  child: Text(
                    'Wyświetl',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14
                    ),
                  )
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff9DCEFF),
                      Color(0xff92A3FD)
                    ]),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
          ],
        ),
      );
    }, 
    separatorBuilder: ((context, index) => SizedBox(width: 25,)),
    itemCount: recommendations.length,
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.only(
      left: 20,
      right: 20,
    ),
  )
),
SizedBox(height: 40,),
          Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left:25),
                child: Text(
                  'Dodaj swój własny przepis',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
          ],
        ),
        
        Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Nazwa przepisu',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Poziom trudności',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Czas przygotowania',
            ),
          ),
          TextField(
            controller: TextEditingController(text: 'x Kcal'),
            decoration: InputDecoration(
              labelText: 'Ilość kalorii',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Potrzebne składniki (ilość nazwa,)',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Kroki przygotowania (Krok 1. , Krok 2. ,)',
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              // Tutaj umieść kod, który ma się wykonać po naciśnięciu przycisku.
            },
            child: Container(
              height: 45,
              width: 130,
              child: Center(
                child: Text(
                  'Dodaj przepis',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff9DCEFF),
                    Color(0xff92A3FD),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
            ),
          )
        ],
      ),
    )
        ],
      ),
    );
  }
}