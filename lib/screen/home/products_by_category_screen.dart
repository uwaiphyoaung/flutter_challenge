import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/api/api_response.dart';
import 'package:flutter_challenge/bloc/home_bloc/home_bloc.dart';
import 'package:flutter_challenge/constants/app.colors.dart';
import 'package:flutter_challenge/screen/widget/loading_widget.dart';

import '../widget/error_widget.dart';
import 'widget/product_item_view.dart';

class ProductListByCategoryScreen extends StatefulWidget {
  Function onReload;

  ProductListByCategoryScreen(this.onReload);

  @override
  ProductListByCategoryScreenState createState() =>
      ProductListByCategoryScreenState();
}

class ProductListByCategoryScreenState
    extends State<ProductListByCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is ProductListSuccessState) {
            if (state.data != null) {
              if (state.data!.isEmpty) {
                return AppErrorWidget(ApiError("No Products", 0),
                    onReload: () {});
              }
              return ListView.builder(
                itemCount: state.data!.length,
                itemBuilder: (context, index) {
                  return ProductItemView(state.data![index]);
                },
              );
            } else {
              return AppErrorWidget(ApiError("Something went wrong", -2),
                  onReload: () {
                widget.onReload(state.categoryName);
              });
            }
          }
          if (state is ProductListFailState) {
            return AppErrorWidget(state.error, onReload: () {
              widget.onReload(state.categoryName);
            });
          }
          return showLoading();
        },
      ),
    );
  }
}
