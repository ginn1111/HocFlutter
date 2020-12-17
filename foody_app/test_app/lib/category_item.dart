import 'package:flutter/material.dart';
import 'package:test_app/foods_page.dart';
import 'package:test_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  CategoryItem({this.category});
  @override
  Widget build(BuildContext context) {
    Color _color = category.color;
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => FoodsPage(category: this.category)));
        Navigator.pushNamed(context, FoodsPage.routeName,
            arguments: {'category': this.category});
      },
      splashColor: Colors.deepOrange,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
                colors: [_color.withOpacity(0.5), _color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Center(
          child: Text(
            category.content,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
