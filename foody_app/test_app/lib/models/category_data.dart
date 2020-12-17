import 'package:test_app/models/category.dart';
import 'package:flutter/material.dart';

import 'food.dart';

class CategoryData {
  static final List<Category> data = [
    Category(id: 1, content: 'Japanese Food', color: Colors.pinkAccent),
    Category(id: 2, content: 'Vietnamese Food', color: Colors.redAccent),
    Category(id: 3, content: 'Amerianese Food', color: Colors.blueAccent),
    Category(id: 4, content: 'Italian Food', color: Colors.orangeAccent),
    Category(id: 5, content: 'Chinese Food', color: Colors.green),
    Category(id: 6, content: 'Adian Food', color: Colors.brown),
  ];

  static final List<Food> dataFood = [
    Food(
        name: 'Shushi',
        duration: Duration(minutes: 30),
        idCategory: 1,
        urlImage:
            'https://www.google.com/imgres?imgurl=https%3A%2F%2Fimg.timviecdaubep.com%2F2020%2F05%2Fsushi-la-gi.jpg&imgrefurl=https%3A%2F%2Ftimviecdaubep.com%2Fsushi-la-gi-cach-phan-biet-sashimi-va-sushi-de-dang-3566.html&tbnid=VVS_EsmdLmcMvM&vet=12ahUKEwjakI6UyNTtAhVTAKYKHeuqAUUQMygEegUIARC7AQ..i&docid=bIbGwqzjaQhurM&w=600&h=400&q=shushi&ved=2ahUKEwjakI6UyNTtAhVTAKYKHeuqAUUQMygEegUIARC7AQ'),
    Food(
        duration: Duration(microseconds: 40),
        name: 'Pho',
        idCategory: 2,
        urlImage:
            'https://www.google.com/imgres?imgurl=https%3A%2F%2Ffood.fnr.sndimg.com%2Fcontent%2Fdam%2Fimages%2Ffood%2Ffullset%2F2018%2F11%2F30%2F0%2FFNK_Instant-Pot-Beef-Pho-H_s4x3.jpg.rend.hgtvcom.826.620.suffix%2F1548176890147.jpeg&imgrefurl=https%3A%2F%2Fwww.foodnetwork.com%2Frecipes%2Ffood-network-kitchen%2Finstant-pot-beef-pho-5486179&tbnid=bSrwJWDBMyjP5M&vet=12ahUKEwi0_IevyNTtAhUXBJQKHRe_AMsQMygEegUIARC-AQ..i&docid=eqI2-so-Wrbd0M&w=826&h=620&q=pho&ved=2ahUKEwi0_IevyNTtAhUXBJQKHRe_AMsQMygEegUIARC-AQ'),
    Food(
        name: 'ABC',
        idCategory: 3,
        urlImage:
            'https://www.google.com/imgres?imgurl=https%3A%2F%2Fproduct.hstatic.net%2F1000356263%2Fproduct%2Ffoody-d_u_h__c_-635863787513733386.jpg&imgrefurl=https%3A%2F%2Fwww.dochienxienque.com%2Fproducts%2Fdau-hu-ca&tbnid=vqm4g5jHtWUqiM&vet=12ahUKEwiFofn4yNTtAhXkJqYKHbX7BVsQMygBegUIARDBAQ..i&docid=Ax1MJ-JTTJ7g9M&w=538&h=379&q=dau%20hu&ved=2ahUKEwiFofn4yNTtAhXkJqYKHbX7BVsQMygBegUIARDBAQ'),
    Food(
        name: 'XYZ',
        idCategory: 3,
        urlImage:
            'https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.shopify.com%2Fs%2Ffiles%2F1%2F1982%2F7063%2Fproducts%2Fd-u-h-non-280gr-vi-house-of-chay-1958168002583_600x%402x.png%3Fv%3D1558080939&imgrefurl=https%3A%2F%2Fwww.houseofchay.com%2Fproducts%2Fd-u-h-non-280gr&tbnid=2_rCFjE3U_t6IM&vet=12ahUKEwiFofn4yNTtAhXkJqYKHbX7BVsQMygAegUIARC-AQ..i&docid=BVj0Y5qoGfBzYM&w=1100&h=1100&q=dau%20hu&ved=2ahUKEwiFofn4yNTtAhXkJqYKHbX7BVsQMygAegUIARC-AQ'),
    Food(
        name: 'Mam tom',
        idCategory: 2,
        urlImage:
            'https://www.google.com/imgres?imgurl=https%3A%2F%2Fnuocmamlegia.com%2Fwp-content%2Fuploads%2F2019%2F09%2Fmam-tom-sach-le-gia.jpg&imgrefurl=https%3A%2F%2Fnuocmamlegia.com%2Fcach-lua-chon-mam-tom-chuan-ngon.html&tbnid=mOAee9Mn6fK9TM&vet=12ahUKEwjtkfLwyNTtAhUmHKYKHXFMB_YQMygIegUIARDFAQ..i&docid=pTCfl92bpaFDnM&w=720&h=1080&q=mam%20tom&ved=2ahUKEwjtkfLwyNTtAhUmHKYKHXFMB_YQMygIegUIARDFAQ'),
    Food(
        name: 'ABC',
        idCategory: 2,
        urlImage:
            'https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.cet.edu.vn%2Fwp-content%2Fuploads%2F2019%2F03%2Fdau-hu.jpg&imgrefurl=https%3A%2F%2Fwww.cet.edu.vn%2Fcach-lam-dau-hu-non-chien-trung-chien-gion-va-sa-ot&tbnid=Y0dCqqzKIzqvHM&vet=12ahUKEwiFofn4yNTtAhXkJqYKHbX7BVsQMygEegUIARDJAQ..i&docid=Yk0PPhgrA6J3-M&w=600&h=400&q=dau%20hu&ved=2ahUKEwiFofn4yNTtAhXkJqYKHbX7BVsQMygEegUIARDJAQ'),
    Food(
        name: 'ABC',
        idCategory: 4,
        urlImage:
            'https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.cet.edu.vn%2Fwp-content%2Fuploads%2F2019%2F03%2Fdau-hu.jpg&imgrefurl=https%3A%2F%2Fwww.cet.edu.vn%2Fcach-lam-dau-hu-non-chien-trung-chien-gion-va-sa-ot&tbnid=Y0dCqqzKIzqvHM&vet=12ahUKEwiFofn4yNTtAhXkJqYKHbX7BVsQMygEegUIARDJAQ..i&docid=Yk0PPhgrA6J3-M&w=600&h=400&q=dau%20hu&ved=2ahUKEwiFofn4yNTtAhXkJqYKHbX7BVsQMygEegUIARDJAQ'),
    Food(
        name: 'ABC',
        idCategory: 5,
        urlImage:
            'https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.cet.edu.vn%2Fwp-content%2Fuploads%2F2019%2F03%2Fdau-hu.jpg&imgrefurl=https%3A%2F%2Fwww.cet.edu.vn%2Fcach-lam-dau-hu-non-chien-trung-chien-gion-va-sa-ot&tbnid=Y0dCqqzKIzqvHM&vet=12ahUKEwiFofn4yNTtAhXkJqYKHbX7BVsQMygEegUIARDJAQ..i&docid=Yk0PPhgrA6J3-M&w=600&h=400&q=dau%20hu&ved=2ahUKEwiFofn4yNTtAhXkJqYKHbX7BVsQMygEegUIARDJAQ'),
  ];
}
