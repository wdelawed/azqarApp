import 'package:azkar/about_us_module/presentation/ui/about_us_page.dart';
import 'package:azkar/config/global_dart.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class MainScreen extends StatelessWidget {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 150);
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " مرحبا بك مجددا",
                          style: primaryTextStyle?.copyWith(
                              color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          " في تطبيق أذكار",
                          style: primaryTextStyle?.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: TextButton(
                        onPressed: () {},
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
                        child: Image.asset(
                          "assets/icons/ic_night_mode.png",
                          width: 18,
                          height: 18,
                          fit: BoxFit.cover,
                        ),
                      ),
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
                      height: 340,
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
                                Text(
                                  "التقويم و مواقيت الصلاة",
                                  style: primaryTextStyle?.copyWith(
                                      fontSize: 18, color: Colors.black),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 11),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                  "assets/icons/ic_calendar_hijri.png"),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    right: 7, left: 7),
                                                child: Text(
                                                  "هجري",
                                                  style: primaryTextStyle
                                                      ?.copyWith(fontSize: 14),
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            width: 142,
                                            height: 38,
                                            margin:
                                                const EdgeInsets.only(top: 10),
                                            decoration: BoxDecoration(
                                              color: const Color(0xff0099FF)
                                                  .withOpacity(.07),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(7),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 17),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "8",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                  Text(
                                                    "شعبان",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                  Text(
                                                    "1442",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                  "assets/icons/ic_calendar_miladi.png"),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    right: 7, left: 7),
                                                child: Text(
                                                  "ميلادي",
                                                  style: primaryTextStyle
                                                      ?.copyWith(fontSize: 14),
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            width: 142,
                                            height: 38,
                                            margin:
                                                const EdgeInsets.only(top: 10),
                                            decoration: BoxDecoration(
                                              color: const Color(0xff0099FF)
                                                  .withOpacity(.07),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(7),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 17),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "12",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                  Text(
                                                    "يونيو",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                  Text(
                                                    "2021",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 135,
                                  margin: const EdgeInsets.only(top: 16),
                                  child: RotatedBox(
                                    quarterTurns: 1,
                                    child: ListWheelScrollView(
                                      controller: _scrollController,
                                      itemExtent: 98,
                                      magnification: 1.5,
                                      clipBehavior: Clip.none,
                                      children: [
                                        RotatedBox(
                                          quarterTurns: 3,
                                          child: Container(
                                            width: 98,
                                            height: 135,
                                            child: Card(
                                              color: const Color(0xffFAFAFA),
                                              elevation: 0,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(7),
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                      "assets/images/img_fajr.png"),
                                                  Text(
                                                    "الفجر",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            height: 2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                  ),
                                                  Text(
                                                    "1:30",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            height: 2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        RotatedBox(
                                          quarterTurns: 3,
                                          child: Container(
                                            width: 98,
                                            height: 135,
                                            child: Card(
                                              color: const Color(0xffFAFAFA),
                                              elevation: 0,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(7),
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                      "assets/images/img_sunrise.png"),
                                                  Text(
                                                    "الشروق",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            height: 2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                  ),
                                                  Text(
                                                    "1:30",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            height: 2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        RotatedBox(
                                          quarterTurns: 3,
                                          child: Container(
                                            width: 98,
                                            height: 135,
                                            child: Card(
                                              color: const Color(0xffFAFAFA),
                                              elevation: 0,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(7),
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                      "assets/images/img_zohr.png"),
                                                  Text(
                                                    "الظهر",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            height: 2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                  ),
                                                  Text(
                                                    "1:30",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            height: 2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        RotatedBox(
                                          quarterTurns: 3,
                                          child: Container(
                                            width: 98,
                                            height: 135,
                                            child: Card(
                                              color: const Color(0xffFAFAFA),
                                              elevation: 0,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(7),
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                      "assets/images/img_asr.png"),
                                                  Text(
                                                    "العصر",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            height: 2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                  ),
                                                  Text(
                                                    "1:30",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            height: 2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        RotatedBox(
                                          quarterTurns: 3,
                                          child: Container(
                                            width: 98,
                                            height: 135,
                                            child: Card(
                                              color: const Color(0xffFAFAFA),
                                              elevation: 0,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(7),
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                      "assets/images/img_magrib.png"),
                                                  Text(
                                                    "المغرب",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            height: 2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                  ),
                                                  Text(
                                                    "1:30",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            height: 2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        RotatedBox(
                                          quarterTurns: 3,
                                          child: Container(
                                            width: 98,
                                            height: 135,
                                            child: Card(
                                              color: const Color(0xffFAFAFA),
                                              elevation: 0,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(7),
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                      "assets/images/img_ishaa.png"),
                                                  Text(
                                                    "العشاء",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            height: 2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                  ),
                                                  Text(
                                                    "1:30",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            height: 2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
                Container(
                  color: Colors.transparent,
                  height: 362,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Container(
                    margin:
                        const EdgeInsets.only(left: 13, right: 13, bottom: 22),
                    height: 340,
                    width: 387,
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
                            Text(
                              "الخيارات و الخصائص",
                              style: primaryTextStyle?.copyWith(
                                  fontSize: 18, color: Colors.black),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: Material(
                                      animationDuration:
                                          const Duration(milliseconds: 500),
                                      type: MaterialType.card,
                                      elevation: 0,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(9),
                                      ),
                                      child: Container(
                                        height: 51,
                                        decoration: const BoxDecoration(
                                          color: Color(0xffF9F9F9),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(9),
                                          ),
                                        ),
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                  "assets/icons/ic_azkar_group.png"),
                                              Expanded(
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 18),
                                                  child: Text(
                                                    "مجموعة الأذكار الصوتية",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Image.asset(
                                                      "assets/icons/ic_chevron_left.png"))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: Material(
                                      animationDuration:
                                          const Duration(milliseconds: 500),
                                      type: MaterialType.card,
                                      elevation: 0,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(9),
                                      ),
                                      child: Container(
                                        height: 51,
                                        decoration: const BoxDecoration(
                                          color: Color(0xffF9F9F9),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(9),
                                          ),
                                        ),
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                  "assets/icons/ic_alarm_settings.png"),
                                              Expanded(
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 18, left: 18),
                                                  child: Text(
                                                    "إعدادات التنبيه",
                                                    style: primaryTextStyle
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Image.asset(
                                                      "assets/icons/ic_chevron_left.png"))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Share.share(
                                          "https://play.google.com/store/apps/details?id=easy.sudoku.puzzle.solver.free");
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      child: Material(
                                        animationDuration:
                                            const Duration(milliseconds: 500),
                                        type: MaterialType.card,
                                        elevation: 0,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(9),
                                        ),
                                        child: Container(
                                          height: 51,
                                          decoration: const BoxDecoration(
                                            color: Color(0xffF9F9F9),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(9),
                                            ),
                                          ),
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Image.asset(
                                                    "assets/icons/ic_share_app.png"),
                                                Expanded(
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 18,
                                                            left: 18),
                                                    child: Text(
                                                      "مشاركه البرنامج",
                                                      style: primaryTextStyle
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Image.asset(
                                                        "assets/icons/ic_chevron_left.png"))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => AboutUsPage()));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      child: Material(
                                        animationDuration:
                                            const Duration(milliseconds: 500),
                                        type: MaterialType.card,
                                        elevation: 0,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(9),
                                        ),
                                        child: Container(
                                          height: 51,
                                          decoration: const BoxDecoration(
                                            color: Color(0xffF9F9F9),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(9),
                                            ),
                                          ),
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Image.asset(
                                                    "assets/icons/ic_about_us.png"),
                                                Expanded(
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 18,
                                                            left: 18),
                                                    child: Text(
                                                      "من نحن",
                                                      style: primaryTextStyle
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Image.asset(
                                                        "assets/icons/ic_chevron_left.png"))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
