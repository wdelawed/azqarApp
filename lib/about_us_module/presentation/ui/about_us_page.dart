import 'package:azkar/config/global_dart.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

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
                                    "من نحن",
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
                              Container(
                                margin: const EdgeInsets.only(top: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 11),
                                      child: const Text(
                                        "فريق التصميم و الفنون البصرية",
                                        style: primaryTextStyle,
                                      ),
                                    ),
                                    Text(
                                      "Artist - منال سعيد محمد عبد الله",
                                      style: secondaryTextStyle?.copyWith(
                                          height: 2),
                                    ),
                                    Text(
                                      "Graphic Designer - أحمد سيف الدين محمد",
                                      style: secondaryTextStyle?.copyWith(
                                          height: 2),
                                    ),
                                    Text(
                                      "Design Lead , UXD - محمد محمد عكاشة",
                                      style: secondaryTextStyle?.copyWith(
                                          height: 2),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 17),
                                      child: Divider(
                                        thickness: 1,
                                        color: const Color(0xff707070)
                                            .withOpacity(.11),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 11),
                                      child: const Text(
                                        "فريق التطوير",
                                        style: primaryTextStyle,
                                      ),
                                    ),
                                    Text(
                                      "محمد أحمد محمد العوض - FullStack Developer",
                                      style: secondaryTextStyle?.copyWith(
                                          height: 2),
                                    ),
                                    Text(
                                      "النبراس سيب سيبس - FullStack Developer",
                                      style: secondaryTextStyle?.copyWith(
                                          height: 2),
                                    ),
                                    Text(
                                      "صفاء شهاب - Software Tester",
                                      style: secondaryTextStyle?.copyWith(
                                          height: 2),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 17),
                                      child: Divider(
                                        thickness: 1,
                                        color: const Color(0xff707070)
                                            .withOpacity(.11),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 11),
                                      child: const Text(
                                        "فريق التصميم و الفنون البصرية",
                                        style: primaryTextStyle,
                                      ),
                                    ),
                                    Text(
                                      "Artist - منال سعيد محمد عبد الله",
                                      style: secondaryTextStyle?.copyWith(
                                          height: 2),
                                    ),
                                    Text(
                                      "Graphic Designer - أحمد سيف الدين محمد",
                                      style: secondaryTextStyle?.copyWith(
                                          height: 2),
                                    ),
                                    Text(
                                      "Design Lead , UXD - محمد محمد عكاشة",
                                      style: secondaryTextStyle?.copyWith(
                                          height: 2),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 17),
                                      child: Divider(
                                        thickness: 1,
                                        color: const Color(0xff707070)
                                            .withOpacity(.11),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
