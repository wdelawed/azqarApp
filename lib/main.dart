import 'dart:isolate';

import 'package:azkar/config/global_dart.dart';
import 'package:azkar/main_module/presentation/bloc/prayertimings_bloc.dart';
import 'package:azkar/notifications_settings_module/data/models/not_setting_item.dart';
import 'package:azkar/notifications_settings_module/presentation/blocs/azkar_notifications_settings_bloc.dart';
import 'package:azkar/shared_libs/blocs/azkar_audio_player_bloc.dart';
import 'package:azkar/splash_module/ui/splash_screen.dart';
import 'package:azkar/zikr_collection_module/representation/bloc/bloc/zikr_collection_bloc.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:workmanager/workmanager.dart';
import 'dependency_injection.dart' as di;
import 'package:firebase_core/firebase_core.dart';

void callbackDispatcher() async {
  await JustAudioBackground.init(
      androidNotificationChannelId: 'com.khair.azkar.notifications',
      androidNotificationChannelName: 'الأذكار',
      androidNotificationOngoing: true,
      notificationColor: appButtonPrimaryColor);
  await Firebase.initializeApp();
  Isolate.current.addErrorListener(RawReceivePort((pair) async {
    final List<dynamic> errorAndStacktrace = pair;
    await FirebaseCrashlytics.instance.recordError(
      errorAndStacktrace.first,
      errorAndStacktrace.last,
      fatal: true,
    );
  }).sendPort);

  audioPlayerBloc ??= AzkarAudioPlayerBloc();
  Workmanager().executeTask((task, inputData) async {
    final zikrItem = NotSettingItem.fromMap(inputData ?? {});
    audioPlayerBloc?.add(AzkarAudioPlayerPlayEvent(track: zikrItem));
    await Future.delayed(const Duration(milliseconds: 2000));
    await Future.delayed(AzkarAudioPlayerBloc.audioPlayer?.duration ??
        const Duration(seconds: 2));
    return Future.value(true);
  });
}

AzkarAudioPlayerBloc? audioPlayerBloc;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  audioPlayerBloc = AzkarAudioPlayerBloc();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: kDebugMode);
  await JustAudioBackground.init(
      androidNotificationChannelId: 'com.khair.azkar.notifications',
      androidNotificationChannelName: 'الأذكار',
      androidNotificationOngoing: true,
      notificationColor: appButtonPrimaryColor);

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
        BlocProvider(
            create: (_) => di.locator<AzkarNotificationsSettingsBloc>()),
        BlocProvider(create: (_) => audioPlayerBloc ??= AzkarAudioPlayerBloc()),
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
