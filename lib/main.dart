import 'package:azkar/config/global_dart.dart';
import 'package:azkar/splash_module/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale("AR", "AE")],
      title: 'AZQAR',
      theme: ThemeData(
        textButtonTheme: AzkarMainButton,
        primaryColorLight: const Color(0xff17CA82),
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
    );
  }
}
