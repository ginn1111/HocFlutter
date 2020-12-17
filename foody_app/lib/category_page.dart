import 'package:flutter/material.dart';
import 'package:foody_app/category_item.dart';
import 'models/category_data.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 4 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              maxCrossAxisExtent: 300),
          children: CategoryData.data
              .map((eachData) => CategoryItem(
                    category: eachData,
                  ))
              .toList()),
    );
  }
}
