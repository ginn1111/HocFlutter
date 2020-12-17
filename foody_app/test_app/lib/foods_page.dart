import 'package:flutter/material.dart';
import 'package:test_app/models/category.dart';
import 'package:test_app/models/category_data.dart';

import 'models/food.dart';

class FoodsPage extends StatelessWidget {
  static const String routeName = '/FoodsPage';
  @override
  Widget build(BuildContext context) {
    Map<String, Category> arguments = ModalRoute.of(context).settings.arguments;
    Category category = arguments['category'];
    List<Food> foods = CategoryData.dataFood
        .where((element) => element.idCategory == category.id)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Food list from ${category.content}\'s category'),
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemCount: foods.length,
            itemBuilder: (context, index) {
              Food food = foods[index];
              return Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    clipBehavior: Clip.hardEdge,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading.gif',
                      image: food.urlImage,
                    ),
                  ));
            },
          ),
        ),
      ),
    );
  }
}
