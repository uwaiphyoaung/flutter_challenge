import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/bloc/page_change_cubit.dart';
import 'package:flutter_challenge/screen/products/products_by_category_screen.dart';
import 'package:flutter_challenge/screen/widget/drawer_widget.dart';

import '../constants/app.colors.dart';
import 'home/home_screen.dart';

class AppMenu extends StatefulWidget{

  @override
  AppMenuState createState() => AppMenuState();
}

class AppMenuState extends State<AppMenu>{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _tabSelectedIndex = 0;
  PageController? controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  void _onTapped(int value) {
    setState(() {
      _tabSelectedIndex = value;
    });
    controller?.jumpToPage(value);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (_scaffoldKey.currentState?.isDrawerOpen == true) {
            Navigator.of(context).pop();
            return false;
          }else{
            if(_tabSelectedIndex > 0){
              context.read<PageChangeCubit>().changeTheme("Home");
              controller?.jumpToPage(0);
              return false;
            }else{
              return true;
            }
          }
        },
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: AppColor.background,
          appBar: AppBar(
            centerTitle: true,
            title: BlocBuilder<PageChangeCubit, String>(
              builder: (context, state) {
                return Text(state);
              },
            ),
          ),
          drawer: DrawerWidget(),
          body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: <Widget>[
                HomeScreen(onCategorySelect: (selectedCategory){
                  context.read<PageChangeCubit>().changeTheme(selectedCategory);
                  controller?.jumpToPage(1);
                }),
                ProductListByCategoryScreen(""),
              ],
              onPageChanged: (page) {
                _onTapped(page);
              }
          ),
        )
    );
  }
}