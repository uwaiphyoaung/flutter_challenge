import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/app.colors.dart';

import 'widget/product_item_view.dart';

class ProductListByCategoryScreen extends StatefulWidget{
  String categoryName;
  ProductListByCategoryScreen(this.categoryName);

  @override
  ProductListByCategoryScreenState createState ()=> ProductListByCategoryScreenState();
}

class ProductListByCategoryScreenState extends State<ProductListByCategoryScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index){
          return ProductItemView();
        },
      ),
    );
  }

}