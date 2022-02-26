import 'package:flutter/cupertino.dart';

class OnBoardingPage extends StatelessWidget {
  final String? imagePath;
  const OnBoardingPage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 415 / 321,
        child: Image.asset("$imagePath"),
      ),
    );
  }
}
