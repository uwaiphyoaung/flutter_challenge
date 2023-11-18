import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/app.colors.dart';
import 'package:flutter_challenge/constants/app.textsize.dart';
import 'package:flutter_challenge/screen/home/widget/category_item_view.dart';

import '../widget/line_widget.dart';

class HomeScreen extends StatefulWidget{
  Function onCategorySelect;
  HomeScreen({required this.onCategorySelect});

  @override
  HomeScreenState createState ()=> HomeScreenState();
}
class HomeScreenState extends State<HomeScreen>{

  var categories = [
    "smartphones",
    "laptops",
    "fragrances",
    "skincare",
    "groceries",
    "home-decoration",
    "furniture",
    "tops",
    "womens-dresses",
    "womens-shoes",
    "mens-shirts",
    "mens-shoes",
    "mens-watches",
    "womens-watches",
    "womens-bags",
    "womens-jewellery",
    "sunglasses",
    "automotive",
    "motorcycle",
    "lighting"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20,top: 45,right: 20),
              child: const Text("Categories", style: AppTextSize.largeBlack,),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20,bottom: 10),
              child: line(),
            ),
            ...categories.map((e) => CategoryItemView(e,onItemClick: (categoryName){
              widget.onCategorySelect(categoryName);
            },)),
            const SizedBox(height: 25,)
          ],
        ),
      ),
    );
  }

}