import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/bloc/page_change_cubit.dart';
import 'package:flutter_challenge/constants/app.colors.dart';
import 'package:flutter_challenge/screen/splash/splash_screen.dart';

class ChallengeApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageChangeCubit>(
          create: (BuildContext context) => PageChangeCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Challenge',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
          appBarTheme: const AppBarTheme(
              color: AppColor.primaryColor
          ),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }

}