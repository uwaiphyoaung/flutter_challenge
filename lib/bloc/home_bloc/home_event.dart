part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadCategoryEvent extends HomeEvent{}

class LoadProductByCategoryEvent extends HomeEvent{
  String name;
  LoadProductByCategoryEvent(this.name);
}
