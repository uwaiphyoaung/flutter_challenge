part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadCategoryEvent extends HomeEvent{
  BuildContext context;
  LoadCategoryEvent(this.context);
}

class LoadProductByCategoryEvent extends HomeEvent{
  BuildContext context;
  String name;
  LoadProductByCategoryEvent(this.context, this.name);
}
