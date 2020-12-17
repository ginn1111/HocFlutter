import 'package:flutter/material.dart';
import 'package:foody_app/models/category.dart';
import 'package:foody_app/models/category_data.dart';

import 'models/food.dart';

class FoodPage extends StatelessWidget {
  static const String routeName = '/FoodPage';

  @override
  Widget build(BuildContext context) {
    Map<String, Category> arguments = ModalRoute.of(context).settings.arguments;
    Category category = arguments['category'];
    List<Food> foods = CategoryData.foodData
        .where((element) => element.idCategory == category.id)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Food List From ${category.content}\'s'),
      ),
      body: SafeArea(
          child: Center(
        child: ListView.builder(
          itemCount: foods.length,
          itemBuilder: (context, index) {
            Food food = foods[index];
            return Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        clipBehavior: Clip.hardEdge,
                        child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/loading.gif',
                            image: food.urlName)),
                    Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              Icon(
                                Icons.timer,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '${food.duration} minutes',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ))
                  ],
                ));
          },
        ),
      )),
    );
  }
}
