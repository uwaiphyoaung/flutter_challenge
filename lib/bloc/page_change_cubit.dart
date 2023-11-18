import 'package:flutter_bloc/flutter_bloc.dart';

class PageChangeCubit extends Cubit<String> {
  PageChangeCubit() : super("Home");

  void changeTheme(String value) {
    emit(value);
  }
}