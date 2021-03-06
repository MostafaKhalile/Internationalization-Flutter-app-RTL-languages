import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_start_kit/Models/ScopeModelWrapper.dart';
import 'package:scoped_model/scoped_model.dart';
import './pages/auth.dart';
import './utils/app_Localization.dart';
import './utils/app_LocalizationDeledate.dart';

void main() => runApp(ScopeModelWrapper());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    // print('appLanguage is ${model.appLocal}');
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => MaterialApp(
            title: 'Flutter Demo',
            onGenerateTitle: (BuildContext context) =>
                DemoLocalizations.of(context).title['title'],
            localizationsDelegates: [
              const AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              Locale("en", ""), // OR Locale('ar', 'AE') OR Other RTL locales
              Locale("ar", ""),
            ],
            locale: model.appLocal,
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            home: AuthPage(),
          ),
    );
  }
}
