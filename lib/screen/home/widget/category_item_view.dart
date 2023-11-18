import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/category_entity.dart';
import '../../../constants/app.textsize.dart';

class CategoryItemView extends StatelessWidget{
  CategoryEntity data;
  Function onItemClick;

  CategoryItemView(this.data,{required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10,left: 15, right: 15),
      child: InkWell(
        onTap: (){
          onItemClick(data.name);
          //context.next(ProductListByCategoryScreen(data));
        },
        child: Card(
          elevation: 0.0,
          child: Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
            child: Text(data.name, style: AppTextSize.medium,),
          ),
        ),
      ),
    );
  }

}