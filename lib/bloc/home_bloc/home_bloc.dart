import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/api/api_response.dart';
import 'package:flutter_challenge/models/product_entity.dart';
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
        emit(CategoryFailState(response.error));
      }
      if(response is Success){
        emit(CategorySuccessState(json.decode(response.data).cast<String>()));
      }
    });

    on<LoadProductByCategoryEvent>((event, emit) async{
      emit(HomeResetState());
      final response = await service.productsByCategory(event.name);
      if(response is Fail){
        emit(ProductListFailState(response.error,event.name));
      }
      if(response is Success){
        emit(ProductListSuccessState(ProductList.fromJson(json.decode(response.data)).products,event.name));
      }
    });
  }
}
