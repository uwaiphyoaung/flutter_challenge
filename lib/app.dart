import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/bloc/home_bloc/home_bloc.dart';
import 'package:flutter_challenge/bloc/page_change_cubit.dart';
import 'package:flutter_challenge/constants/app.colors.dart';
import 'package:flutter_challenge/localization/app_locale.dart';
import 'package:flutter_challenge/screen/splash/splash_screen.dart';
import 'package:flutter_localization/flutter_localization.dart';

class ChallengeApp extends StatefulWidget{

  @override
  ChallengeAppState createState ()=> ChallengeAppState();
}

class ChallengeAppState extends State<ChallengeApp>{
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    _localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.EN, countryCode: 'US'),
        const MapLocale('th', AppLocale.TH, countryCode: 'TH'),
      ],
      initLanguageCode: 'en',
    );
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageChangeCubit>(
          create: (BuildContext context) => PageChangeCubit(),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(),
        ),
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
        supportedLocales: _localization.supportedLocales,
        localizationsDelegates: _localization.localizationsDelegates,
        home: SplashScreen(),
      ),
    );
  }

}