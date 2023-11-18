import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/api/api_response.dart';
import 'package:flutter_challenge/extensions/snackbar_extension.dart';
import 'package:flutter_challenge/models/category_entity.dart';
import 'package:flutter_challenge/models/product_entity.dart';
import 'package:flutter_challenge/persistence/dao/category_dao.dart';
import 'package:flutter_challenge/persistence/dao/product_dao.dart';
import 'package:flutter_challenge/services/home_services.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeServices service = HomeServices();
  HomeBloc() : super(HomeInitial()) {

    on<HomeEvent>((event, emit) {});

    on<LoadCategoryEvent>((event, emit) async{
      emit(HomeResetState());
      final response = await service.loadCategory();
      if(response is Fail){
        var localData = await CategoryDao().getAll();
        if(localData.isEmpty){
          emit(CategoryFailState(response.error));
        }else{
          // ignore: use_build_context_synchronously
          event.context.catchError(response.error);
          emit(CategorySuccessState(await CategoryDao().getAll()));
        }
      }
      if(response is Success){
        List<String> data = json.decode(response.data).cast<String>();
        CategoryDao().deleteAll();
        for (String category in data) {
          CategoryDao().add(CategoryEntity(category));
        }
        emit(CategorySuccessState(await CategoryDao().getAll()));
      }
    });

    on<LoadProductByCategoryEvent>((event, emit) async{
      emit(HomeResetState());
      final response = await service.productsByCategory(event.name);
      if(response is Fail){
        var localData = await ProductDao().getProductsByCategory(event.name);
        if(localData.isEmpty){
          emit(ProductListFailState(response.error,event.name));
        }else{
          // ignore: use_build_context_synchronously
          event.context.catchError(response.error);
          emit(ProductListSuccessState(localData,event.name));
        }
      }
      if(response is Success){
        List<ProductEntity> products = ProductList.fromJson(json.decode(response.data)).products??[];
        ProductDao().deleteByCategory(event.name);
        for (ProductEntity product in products) {
          ProductDao().add(product);
        }
        emit(ProductListSuccessState(ProductList.fromJson(json.decode(response.data)).products,event.name));
      }
    });
  }
}
