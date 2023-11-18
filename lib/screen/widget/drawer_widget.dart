import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/app.textsize.dart';
import 'package:flutter_challenge/localization/app_locale.dart';
import 'package:flutter_challenge/screen/widget/line_widget.dart';
import 'package:flutter_localization/flutter_localization.dart';

class DrawerWidget extends StatelessWidget{
  VoidCallback onLanguageChange;
  DrawerWidget(this.onLanguageChange);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20,top: 45),
            child: Text(AppLocale.language.getString(context), style: AppTextSize.largeBlack,),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20,bottom: 10),
            child: line(),
          ),
          ListTile(
            leading: Image.asset("assets/images/thai.png", width: 24),
            title: const Text("ไทย"),
            onTap: (){
              FlutterLocalization.instance.translate('th');
              onLanguageChange();
            },
            trailing: FlutterLocalization.instance.currentLocale?.languageCode == "th"? const Icon(Icons.check):null,
          ),
          ListTile(
            leading: Image.asset("assets/images/usa.png", width: 24),
            title: const Text("English"),
            onTap: (){
              FlutterLocalization.instance.translate('en');
              onLanguageChange();
            },
            trailing: FlutterLocalization.instance.currentLocale?.languageCode == "en"? const Icon(Icons.check):null,
          )
        ],
      ),
    );
  }

}