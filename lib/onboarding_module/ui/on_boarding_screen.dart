import 'package:azkar/config/global_dart.dart';
import 'package:azkar/main_module/ui/main_screen.dart';
import 'package:azkar/onboarding_module/ui/onboarding_page.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      // if(_pageController.page!.round() == _pageController.page)
      setState(() {
        _selectedIndex = _pageController.page!.floor();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            PageView(
              children: const [
                OnBoardingPage(imagePath: "assets/images/img_onboarding_1.png"),
                OnBoardingPage(imagePath: "assets/images/img_onboarding_2.png"),
                OnBoardingPage(imagePath: "assets/images/img_onboarding_3.png"),
              ],
              controller: _pageController,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.only(left: 46, right: 46),
          height: 287,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: DotsIndicator(
                  dotsCount: 3,
                  position: _selectedIndex.ceilToDouble(),
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 18),
                child: Text(
                  "تسوق من أفضل المتاجر في المملكة",
                  style: primaryTextStyle,
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8, bottom: 34),
                child: Text(
                  "يتيح تطبيق إجارة توفير كل العروض الموجودة في المنطقة والتي يمكنك التعامل معها و طلب خدمات الإجار و حتي البيع و التي يمكنك الإختيار منها ",
                  style: secondaryTextStyle,
                  textAlign: TextAlign.start,
                ),
              ),
              AspectRatio(
                aspectRatio: 319 / 56,
                child: Row(
                  children: [
                    Expanded(
                        child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                        ),
                      ),
                      child: Text(
                        _selectedIndex < 2 ? "التالي" : "إبدا الإستخدام",
                        style: primaryTextStyle?.copyWith(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_selectedIndex < 2) {
                          setState(() {
                            _selectedIndex += 1;
                            _pageController.animateToPage(_selectedIndex,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          });
                        } else {
                          //jump to main screen here
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => MainScreen()));
                        }
                      },
                    )),
                    _selectedIndex < 2
                        ? Container(
                            width: 105,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent),
                              onPressed: () {},
                              child: Text(
                                "تخطي",
                                style:
                                    secondaryTextStyle?.copyWith(fontSize: 16),
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
