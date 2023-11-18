import 'package:flutter/material.dart';
import 'package:flutter_challenge/localization/app_locale.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitFadingCircle(
          size: 40.0,
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10)),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Text(AppLocale.loading.getString(context)),
      ],
    );
  }

}