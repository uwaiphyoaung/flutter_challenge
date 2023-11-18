import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/api/api_response.dart';
import 'package:flutter_challenge/bloc/home_bloc/home_bloc.dart';
import 'package:flutter_challenge/constants/app.colors.dart';
import 'package:flutter_challenge/constants/app.textsize.dart';
import 'package:flutter_challenge/screen/home/presenter/home_presenter.dart';
import 'package:flutter_challenge/screen/home/widget/category_item_view.dart';
import 'package:flutter_challenge/screen/widget/error_widget.dart';
import 'package:flutter_challenge/screen/widget/loading_widget.dart';

import '../widget/line_widget.dart';

class HomeScreen extends StatefulWidget{
  Function onCategorySelect;
  HomeScreen({required this.onCategorySelect});

  @override
  HomeScreenState createState ()=> HomeScreenState();
}
class HomeScreenState extends State<HomeScreen>{

  @override
  void initState() {
    HomePresenter.loadCategory(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if(state is CategorySuccessState){
            if(state.data.isEmpty){
              return AppErrorWidget(ApiError("No Category", -2),
                  onReload: () {}
              );
            }
            return SingleChildScrollView(
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
                  ...state.data.map((e) => CategoryItemView(e,onItemClick: (categoryName){
                    widget.onCategorySelect(categoryName);
                  },)),
                  const SizedBox(height: 25,)
                ],
              ),
            );
          }
          if(state is CategoryFailState){
            return AppErrorWidget(state.error, onReload: (){
              HomePresenter.loadCategory(context);
            },);
          }
          return showLoading();
        },
      ),
    );
  }

  @override
  void dispose() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    super.dispose();
  }

}