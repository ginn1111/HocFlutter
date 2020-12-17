import 'package:flutter/material.dart';
import 'package:foody_app/models/category.dart';

import 'food_page.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  CategoryItem({this.category});

  @override
  Widget build(BuildContext context) {
    Color _color = category.color;
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => FoodPage(
        //           category: this.category,
        //         )));
        Navigator.pushNamed(context, FoodPage.routeName,
            arguments: {'category': this.category});
      },
      splashColor: Colors.deepOrangeAccent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
              colors: [_color.withOpacity(0.5), _color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Center(
          child: Text(
            category.content,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
