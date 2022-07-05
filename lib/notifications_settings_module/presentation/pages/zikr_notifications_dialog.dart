import 'package:azkar/config/global_dart.dart';
import 'package:azkar/notifications_settings_module/data/models/not_setting_item.dart';
import 'package:azkar/notifications_settings_module/presentation/blocs/azkar_notifications_settings_bloc.dart';
import 'package:azkar/shared_libs/notifications_times.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZikrNotificationsDialog extends StatefulWidget {
  final NotSettingItem zikr;
  const ZikrNotificationsDialog({Key? key, required this.zikr})
      : super(key: key);
  @override
  State<ZikrNotificationsDialog> createState() =>
      // ignore: no_logic_in_create_state
      _ZikrNotificationsDialogState(zikr);
}

class _ZikrNotificationsDialogState extends State<ZikrNotificationsDialog> {
  int zikrId = -1;
  bool notificationsEnabled = false;
  int? notificationsDurationMinutes;
  String? notifPeriodArabic;
  String? notifPeriodEnglish;

  ExpandableController? _expandableController;

  _ZikrNotificationsDialogState(NotSettingItem zikr) {
    zikrId = zikr.zikrAudioId;
    notificationsEnabled = zikr.notificationEnabled;
    notificationsDurationMinutes = zikr.notificationIntervalMinutes;
    notifPeriodArabic = zikr.notificationPeriodArabic;
    notifPeriodEnglish = zikr.notificationPeriodEnglish;

    _expandableController =
        ExpandableController(initialExpanded: notificationsEnabled);
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 378,
        height: notificationsEnabled ? null : 320,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                color: const Color(0xff707070).withOpacity(.11),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: const BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.all(
                  Radius.circular(9),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "تشغيل المذكر",
                    style: secondaryTextStyle,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Material(
                      clipBehavior: Clip.hardEdge,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            notificationsEnabled =
                                notificationsEnabled ? false : true;
                          });

                          _expandableController!.expanded =
                              notificationsEnabled;
                        },
                        icon: Image.asset(
                          notificationsEnabled
                              ? "assets/icons/ic_switch_on.png"
                              : "assets/icons/ic_switch_off.png",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.all(
                  Radius.circular(9),
                ),
              ),
              child: ExpandablePanel(
                theme: ExpandableThemeData.withDefaults(
                  const ExpandableThemeData(
                    tapHeaderToExpand: false,
                    hasIcon: false,
                  ),
                  context,
                ),
                controller: _expandableController,
                header: Container(
                  //color: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "إختيار وقت التذكير",
                    style: secondaryTextStyle?.copyWith(
                        fontWeight: FontWeight.bold),
                  ),
                ),
                collapsed: Container(
                  color: Colors.red,
                ),
                expanded: notificationsEnabled
                    ? SizedBox(
                        height: notificationsEnabled ? 310 : 0,
                        child: ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (_, __) => Divider(
                                  height: 1,
                                  thickness: 1,
                                  color:
                                      const Color(0xff707070).withOpacity(.04),
                                  indent: 16,
                                  endIndent: 16,
                                ),
                            itemBuilder: (_, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    notificationsDurationMinutes =
                                        notificationTimes[index]
                                            .durationMinutes;
                                    notifPeriodArabic =
                                        notificationTimes[index].periodArabic;
                                    notifPeriodEnglish =
                                        notificationTimes[index].periodEnglish;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 9),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        notificationTimes[index].periodArabic,
                                        style: secondaryTextStyle?.copyWith(
                                            fontSize: 12),
                                      ),
                                      notificationsDurationMinutes ==
                                              notificationTimes[index]
                                                  .durationMinutes
                                          ? const Icon(
                                              CupertinoIcons
                                                  .checkmark_alt_circle_fill,
                                              color: appButtonPrimaryColor,
                                              size: 16,
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: notificationTimes.length),
                      )
                    : Container(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<AzkarNotificationsSettingsBloc>(context)
                          .add(notificationsEnabled
                              ? AzkarNotificationsSettingsEnableEvent(
                                  zikrId: zikrId,
                                  periodArabic: notifPeriodArabic ?? "",
                                  periodEnglish: notifPeriodEnglish ?? "",
                                  duration: Duration(
                                      minutes:
                                          notificationsDurationMinutes ?? 15))
                              : AzkarNotificationsSettingsDisableEvent(
                                  zikrId: zikrId));
                      Navigator.pop(context);
                    },
                    child: Text(
                      "تم",
                      style: secondaryTextStyle?.copyWith(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(fixedSize: const Size(150, 46)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                        fixedSize: const Size(100, 46),
                        backgroundColor: Colors.white,
                        onSurface: Colors.red),
                    child: const Text(
                      "إلغاء",
                      style: secondaryTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
