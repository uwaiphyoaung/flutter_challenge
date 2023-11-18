import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/app.textsize.dart';
import 'package:flutter_challenge/screen/widget/image_widget.dart';

class ProductItemView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 15,bottom:15),
      margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            height: 100,
            child: ImageView(
              url: "https://www.skincenterofsouthmiami.com/wp-content/uploads/2018/06/Skin-Center-of-South-Miami-Facials-and-Skin-Care.jpg",
              width: 150,
              height: 100,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("iPhone 9",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextSize.largeBlack),
                  const SizedBox(height: 10,),
                  Text("An apple mobile which is nothing like apple")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}