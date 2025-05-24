import 'package:flutter/material.dart';
import 'package:ksehat/intropage_screen.dart';

class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const IntroContent(
      lottieUrl:
          'https://lottie.host/3caf5194-0fb4-4a37-848b-88872891f88c/zyiAwZCsHf.json',
      title: 'Selamat Datang',
      description:
          'Nikmati pengalaman menjelajahi beragam menu lezat dari Ichiban Sushi. Temukan pilihan favoritmu dan rasakan kelezatan khas Jepang di ujung jarimu!',
    );
  }
}
