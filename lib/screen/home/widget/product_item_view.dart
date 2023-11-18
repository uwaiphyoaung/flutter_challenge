import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/app.textsize.dart';
import 'package:flutter_challenge/extensions/string_extension.dart';
import 'package:flutter_challenge/models/product_entity.dart';
import 'package:flutter_challenge/screen/widget/image_widget.dart';

class ProductItemView extends StatelessWidget{
  ProductEntity data;
  ProductItemView(this.data);

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
              url: data.thumbnail,
              width: 150,
              height: 100,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title.orEmpty(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextSize.largeBlack),
                  const SizedBox(height: 10,),
                  Text(data.description.orEmpty(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}