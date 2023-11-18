import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/bloc/home_bloc/home_bloc.dart';

class HomePresenter{
  const HomePresenter._();

  static void loadCategory(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(LoadCategoryEvent());
  }

  static void loadProducts(BuildContext context, String category) {
    BlocProvider.of<HomeBloc>(context).add(LoadProductByCategoryEvent(category));
  }
}