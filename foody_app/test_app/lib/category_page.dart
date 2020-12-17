import 'package:flutter/material.dart';
import 'package:test_app/category_item.dart';
import 'package:test_app/models/category_data.dart';

class CategoryPage extends StatelessWidget {
  static const String routeName = '/CategoryPage';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            maxCrossAxisExtent: 300),
        children: CategoryData.data
            .map((eachCategory) => CategoryItem(
                  category: eachCategory,
                ))
            .toList(),
      ),
    );
  }
}
