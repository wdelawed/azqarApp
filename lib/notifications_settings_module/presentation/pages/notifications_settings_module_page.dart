import 'package:azkar/config/global_dart.dart';
import 'package:azkar/notifications_settings_module/presentation/blocs/azkar_notifications_settings_bloc.dart';
import 'package:azkar/shared_libs/blocs/azkar_audio_player_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsSettingsPage extends StatefulWidget {
  const NotificationsSettingsPage({Key? key, this.arguments}) : super(key: key);
  final Map<String, dynamic>? arguments;

  @override
  _NotificationsSettingsPageState createState() =>
      _NotificationsSettingsPageState();
}

class _NotificationsSettingsPageState extends State<NotificationsSettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 225,
              padding: const EdgeInsets.only(
                  top: 55, left: 32, right: 31, bottom: 110),
              decoration: const BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      AssetImage("assets/images/img_mainscreen_background.png"),
                ),
              ),
              child: Container(
                height: 52,
                constraints: const BoxConstraints(maxHeight: 52),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                            fixedSize: const Size(40, 40),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                            ),
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.black.withOpacity(.31),
                          ),
                          child: const Icon(
                            Icons.chevron_left,
                            size: 18,
                          )),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 129,
                        right: 13,
                        left: 13,
                        bottom: 13,
                      ),
                      width: 366,
                      child: Card(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 26, horizontal: 36),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "إعدادات التنبيه",
                                    style: primaryTextStyle?.copyWith(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                  const Icon(
                                    Icons.alarm,
                                    size: 27,
                                    color: Color(0xffFF9200),
                                  )
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 17),
                                child: Divider(
                                  thickness: 1,
                                  color:
                                      const Color(0xff707070).withOpacity(.11),
                                ),
                              ),
                              BlocBuilder<AzkarNotificationsSettingsBloc,
                                      AzkarNotificationsSettingsState>(
                                  builder: (_, state) {
                                if (state
                                    is AzkarNotificationsSettingsLoadedState) {
                                  return SizedBox(
                                    height: 500,
                                    child: ListView.builder(
                                      itemCount: state.settings.length,
                                      itemBuilder: (_, index) => Card(
                                        elevation: 0,
                                        child: BlocBuilder<AzkarAudioPlayerBloc,
                                            AzkarAudioPlayerState>(
                                          builder: (context, playerState) {
                                            if (playerState
                                                    is AzkarAudioPlayerPlayingState &&
                                                playerState.tackId ==
                                                    state.settings[index]
                                                        .zikrAudioId) {
                                              return ListTile(
                                                selected: true,
                                                tileColor:
                                                    const Color(0xffFCFCFC),
                                                subtitle: Text(
                                                  state.settings[index]
                                                          .notificationEnabled
                                                      ? "كل ${state.settings[index].notificationPeriodArabic}"
                                                      : "التنبيه لا يعمل لهذا الذكر",
                                                  style: secondaryTextStyle
                                                      ?.copyWith(
                                                    fontSize: 9,
                                                    color: secondaryTextStyle
                                                        ?.color
                                                        ?.withOpacity(.7),
                                                  ),
                                                ),
                                                title: Text(
                                                  state
                                                      .settings[index].zikrName,
                                                  style: secondaryTextStyle,
                                                ),
                                                trailing: Container(
                                                  width: 34,
                                                  height: 34,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                              0XFF17CA82)
                                                          .withOpacity(0.07),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  17))),
                                                  child: IconButton(
                                                    color:
                                                        const Color(0xff17CA82),
                                                    icon: const Icon(
                                                      Icons.pause,
                                                      size: 18,
                                                    ),
                                                    onPressed: () {
                                                      BlocProvider.of<
                                                                  AzkarAudioPlayerBloc>(
                                                              context)
                                                          .add(AzkarAudioPlayerPauseEvent(
                                                              track: state
                                                                      .settings[
                                                                  index]));
                                                    },
                                                  ),
                                                ),
                                              );
                                            }
                                            if (playerState
                                                    is AzkarAudioPlayerLoadingState &&
                                                playerState.tackId ==
                                                    state.settings[index]
                                                        .zikrAudioId) {
                                              return ListTile(
                                                tileColor:
                                                    const Color(0xffFCFCFC),
                                                title: Text(
                                                  state
                                                      .settings[index].zikrName,
                                                  style: secondaryTextStyle,
                                                ),
                                                subtitle: Text(
                                                  state.settings[index]
                                                          .notificationEnabled
                                                      ? "كل ${state.settings[index].notificationPeriodArabic}"
                                                      : "التنبيه لا يعمل لهذا الذكر",
                                                  style: secondaryTextStyle
                                                      ?.copyWith(
                                                    fontSize: 9,
                                                    color: secondaryTextStyle
                                                        ?.color
                                                        ?.withOpacity(.7),
                                                  ),
                                                ),
                                                trailing: Container(
                                                  width: 34,
                                                  height: 34,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                              0XFF17CA82)
                                                          .withOpacity(0.07),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  17))),
                                                  child: const SizedBox(
                                                    width: 18,
                                                    height: 18,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeWidth: 1,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }

                                            return ListTile(
                                              tileColor:
                                                  const Color(0xffFCFCFC),
                                              title: Text(
                                                state.settings[index].zikrName,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: secondaryTextStyle,
                                              ),
                                              subtitle: Text(
                                                state.settings[index]
                                                        .notificationEnabled
                                                    ? "كل ${state.settings[index].notificationPeriodArabic}"
                                                    : "التنبيه لا يعمل لهذا الذكر",
                                                style: secondaryTextStyle
                                                    ?.copyWith(
                                                  fontSize: 9,
                                                  color: secondaryTextStyle
                                                      ?.color
                                                      ?.withOpacity(.7),
                                                ),
                                              ),
                                              trailing: Container(
                                                width: 34,
                                                height: 34,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0XFF17CA82)
                                                            .withOpacity(0.07),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                17))),
                                                child: IconButton(
                                                  color:
                                                      const Color(0xff17CA82),
                                                  icon: const Icon(
                                                    Icons.play_arrow_rounded,
                                                    size: 18,
                                                  ),
                                                  onPressed: () async {
                                                    BlocProvider.of<
                                                                AzkarAudioPlayerBloc>(
                                                            context)
                                                        .add(AzkarAudioPlayerPlayEvent(
                                                            track:
                                                                state.settings[
                                                                    index]));
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return const Center(
                                  child: SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 1,
                                    ),
                                  ),
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
