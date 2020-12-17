import 'package:foody_app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:foody_app/models/food.dart';

class CategoryData {
  static final List<Category> data = [
    Category(id: 1, content: 'Japan Food', color: Colors.red[400]),
    Category(id: 2, content: 'Pizza', color: Colors.yellow),
    Category(id: 3, content: 'Noodle', color: Colors.orange),
    Category(id: 4, content: 'Vegetable', color: Colors.green),
    Category(id: 5, content: 'Drinks', color: Colors.blue[100]),
  ];
  static final List<Food> foodData = [
    Food(
        urlName:
            'https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.daynauan.info.vn%2Fwp-content%2Fuploads%2F2016%2F09%2Fsushi-cuon-nam.jpg&imgrefurl=https%3A%2F%2Fdaynauan.info.vn%2Fsushi-cuon-nam&tbnid=e4hAKtiOCaPrjM&vet=12ahUKEwjplL2FwtTtAhXYFKYKHbwGB2IQMygBegUIARCrAQ..i&docid=HGBFq_kThxYmzM&w=600&h=400&q=sushi%20image&ved=2ahUKEwjplL2FwtTtAhXYFKYKHbwGB2IQMygBegUIARCrAQ',
        idCategory: 1,
        name: 'Shushi',
        complexity: Complexity.hard,
        duration: 50,
        ingredient: ['Fish', 'Washabi', 'Rice']),
    Food(
        urlName:
            'https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.tgdd.vn%2FProducts%2FImages%2F2565%2F77622%2Fbhx%2Fmi-hao-hao-tom-chua-cay-goi-75g-201912051022208226.JPG&imgrefurl=https%3A%2F%2Fwww.bachhoaxanh.com%2Fmi%2Fmi-hao-hao-tom-chua-cay-goi-75g&tbnid=UMRSWAmffCZ2JM&vet=12ahUKEwiRlfvvwtTtAhUODpQKHbgYDAcQMygAegUIARDEAQ..i&docid=Ue4SJD1w-BqHoM&w=1024&h=768&q=Mi%20Haoao&ved=2ahUKEwiRlfvvwtTtAhUODpQKHbgYDAcQMygAegUIARDEAQ',
        idCategory: 3,
        name: 'Mi Hao Hao',
        complexity: Complexity.simple),
    Food(
      urlName:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.huongnghiepaau.com%2Fwp-content%2Fuploads%2F2017%2F07%2F999cf916d676bcea9e5646256b3e0198.jpg&imgrefurl=https%3A%2F%2Fwww.huongnghiepaau.com%2Fcach-lam-banh-pizza-hai-san&tbnid=DvCMBp_jhfGZ5M&vet=12ahUKEwi6yP3EwtTtAhUPHKYKHZaoCZcQMygGegUIARDFAQ..i&docid=rFgOe5pJ91rOMM&w=620&h=400&q=pizza&ved=2ahUKEwi6yP3EwtTtAhUPHKYKHZaoCZcQMygGegUIARDFAQ',
      idCategory: 2,
      name: 'Pizza fake',
    ),
    Food(
      urlName:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fdaylambanh.edu.vn%2Fwp-content%2Fuploads%2F2020%2F05%2Fcach-lam-pizza.jpg&imgrefurl=https%3A%2F%2Fdaylambanh.edu.vn%2Flam-banh-pizza-cuc-don-gian&tbnid=mNp-aU-7sdUZ3M&vet=12ahUKEwi6yP3EwtTtAhUPHKYKHZaoCZcQMygBegUIARC5AQ..i&docid=aaR1mmrSI5dUeM&w=600&h=400&q=pizza&ved=2ahUKEwi6yP3EwtTtAhUPHKYKHZaoCZcQMygBegUIARC5AQ',
      idCategory: 2,
      name: 'Pizza real',
    ),
    Food(
      urlName:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.loveandlemons.com%2Fwp-content%2Fuploads%2F2019%2F07%2FIMG_19756-cheesecrop.jpg&imgrefurl=https%3A%2F%2Fwww.loveandlemons.com%2Fburrata%2F&tbnid=eAIDbSeREnJPjM&vet=12ahUKEwi3_bK3wtTtAhXPAaYKHeAjC40QMygGegUIARC8AQ..i&docid=HHhZN1KR8zjl5M&w=1106&h=1532&q=tomato%20mix%20cheese&ved=2ahUKEwi3_bK3wtTtAhXPAaYKHeAjC40QMygGegUIARC8AQ',
      idCategory: 4,
      name: 'Tomato mix cheese',
    ),
    Food(
        duration: 15,
        urlName:
            'https://cdn.tgdd.vn/Files/2020/05/22/1257398/cach-lam-tau-hu-ky-mem-ngon-don-gian-chuan-vi-ngay-tai-nha-11.jpg',
        idCategory: 5,
        name: 'Orange Juice',
        ingredient: ['Orange', 'Sugar'])
  ];
}
