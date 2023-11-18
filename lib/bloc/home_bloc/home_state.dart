part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeResetState extends HomeState {}

class CategorySuccessState extends HomeState{
  List<String> data;
  CategorySuccessState(this.data);
}

class CategoryFailState extends HomeState {
  ApiError error;
  CategoryFailState(this.error);
}

class ProductListSuccessState extends HomeState{
  List<ProductEntity>? data;
  String categoryName;
  ProductListSuccessState(this.data,this.categoryName);
}

class ProductListFailState extends HomeState {
  ApiError error;
  String categoryName;
  ProductListFailState(this.error,this.categoryName);
}
