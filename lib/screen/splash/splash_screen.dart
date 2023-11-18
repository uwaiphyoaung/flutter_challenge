import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/extensions/context_extension.dart';
import 'package:flutter_challenge/screen/app_menu.dart';
import 'package:flutter_challenge/screen/widget/loading_widget.dart';

class SplashScreen extends StatefulWidget{

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>{

  void startTimer(){
    var duration = const Duration(seconds: 3);
    Timer.periodic(duration, (timer) {
      timer.cancel();
      context.replace(AppMenu());
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingWidget(),
      ),
    );
  }

}