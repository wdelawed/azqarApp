import 'package:azkar/config/global_dart.dart';
import 'package:azkar/main_module/presentation/bloc/prayertimings_bloc.dart';
import 'package:azkar/splash_module/ui/splash_screen.dart';
import 'package:azkar/zikr_collection_module/representation/bloc/bloc/zikr_collection_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:workmanager/workmanager.dart';
import 'dependency_injection.dart' as di;

void callbackDispatcher() {}

void main() async {
  di.init();

  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: kDebugMode);
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<PrayertimingsBloc>()),
        BlocProvider(create: (_) => di.locator<ZikrCollectionBloc>()),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale("ar")],
        title: 'AZQAR',
        theme: ThemeData(
          textButtonTheme: azkarMainButton,
          primaryColorLight: const Color(0xff17CA82),
          primarySwatch: Colors.green,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
