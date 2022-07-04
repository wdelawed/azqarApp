import 'package:azkar/config/global_dart.dart';
import 'package:azkar/notifications_settings_module/data/models/not_setting_item.dart';
import 'package:azkar/shared_libs/blocs/azkar_audio_player_bloc.dart';
import 'package:azkar/zikr_collection_module/representation/bloc/bloc/zikr_collection_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZikrCollectionPage extends StatefulWidget {
  const ZikrCollectionPage({Key? key}) : super(key: key);

  @override
  State<ZikrCollectionPage> createState() => _ZikrCollectionPageState();
}

class _ZikrCollectionPageState extends State<ZikrCollectionPage> {
  int playingAudioIndex = -1;

  @override
  void initState() {
    super.initState();
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
                                    "الأذكار الصوتية",
                                    style: primaryTextStyle?.copyWith(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                  const Icon(
                                    Icons.info_outline,
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
                              BlocBuilder<ZikrCollectionBloc,
                                  ZikrCollectionState>(builder: (_, state) {
                                if (state is ZikrCollectionLoadedState) {
                                  return SizedBox(
                                    height: 400,
                                    child: ListView.builder(
                                      itemCount: state.zikrCollection.length,
                                      itemBuilder: (_, index) => Card(
                                        elevation: 0,
                                        child: BlocBuilder<AzkarAudioPlayerBloc,
                                            AzkarAudioPlayerState>(
                                          builder: (context, playerState) {
                                            if (playerState
                                                    is AzkarAudioPlayerPlayingState &&
                                                playerState.tackId ==
                                                    state.zikrCollection[index]
                                                        .id) {
                                              return ListTile(
                                                selected: true,
                                                tileColor:
                                                    const Color(0xffFCFCFC),
                                                title: Text(
                                                  state.zikrCollection[index]
                                                          .name ??
                                                      "null",
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
                                                      final zikr =
                                                          state.zikrCollection[
                                                              index];
                                                      BlocProvider
                                                              .of<
                                                                      AzkarAudioPlayerBloc>(
                                                                  context)
                                                          .add(AzkarAudioPlayerPauseEvent(
                                                              track: NotSettingItem(
                                                                  soundTrackUrl:
                                                                      zikr.url ??
                                                                          "",
                                                                  zikrAudioId:
                                                                      zikr.id ??
                                                                          -1,
                                                                  zikrName: zikr
                                                                          .name ??
                                                                      "Zikr Name",
                                                                  notificationEnabled:
                                                                      false)));
                                                    },
                                                  ),
                                                ),
                                              );
                                            }
                                            if (playerState
                                                    is AzkarAudioPlayerLoadingState &&
                                                playerState.tackId ==
                                                    state.zikrCollection[index]
                                                        .id) {
                                              return ListTile(
                                                tileColor:
                                                    const Color(0xffFCFCFC),
                                                title: Text(
                                                  state.zikrCollection[index]
                                                          .name ??
                                                      "null",
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
                                                state.zikrCollection[index]
                                                        .name ??
                                                    "",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: secondaryTextStyle,
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
                                                    final zikr = state
                                                        .zikrCollection[index];
                                                    BlocProvider
                                                            .of<
                                                                    AzkarAudioPlayerBloc>(
                                                                context)
                                                        .add(AzkarAudioPlayerPlayEvent(
                                                            track: NotSettingItem(
                                                                soundTrackUrl:
                                                                    zikr.url ??
                                                                        "",
                                                                zikrAudioId:
                                                                    zikr.id ??
                                                                        -1,
                                                                zikrName: zikr
                                                                        .name ??
                                                                    "Zikr Name",
                                                                notificationEnabled:
                                                                    false)));
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
