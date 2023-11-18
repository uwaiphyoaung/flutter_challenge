import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/app.textsize.dart';
import 'package:flutter_challenge/screen/widget/line_widget.dart';

class DrawerWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20,top: 45),
            child: const Text("Language", style: AppTextSize.largeBlack,),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20,bottom: 10),
            child: line(),
          ),
          ListTile(
            leading: Image.asset("assets/images/thai.png", width: 24),
            title: const Text("ไทย"),
            onTap: (){

            },
          ),
          ListTile(
            leading: Image.asset("assets/images/usa.png", width: 24),
            title: const Text("English"),
            onTap: (){

            },
          )
        ],
      ),
    );
  }

}