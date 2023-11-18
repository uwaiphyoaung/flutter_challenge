import 'package:flutter/material.dart';
import 'package:flutter_challenge/api/api_response.dart';

import '../../constants/app.colors.dart';

class AppErrorWidget extends StatelessWidget{
  ApiError data;
  VoidCallback onReload;

  AppErrorWidget(this.data,{required this.onReload});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
          child:
          Column(mainAxisSize: MainAxisSize.min, children: [
            Text(data.data,
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            Visibility(
              visible: data.code<0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    elevation: 0,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
                onPressed: onReload,
                child: const Text('Try Again'),
              ),
            ),
          ])),
    );
  }

}