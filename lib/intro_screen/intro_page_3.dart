import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffBFEEA1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animasi Lottie
          SizedBox(
            height: 250,
            child: Center(
              child: Lottie.network(
                'https://lottie.host/f563fd7b-5ff2-4cfa-a13c-4f290a443854/oBxqnsnqAd.json',
                width: 270,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Buah-Buah Sehat',
            style: TextStyle(
              color: Color(0xFF333333),
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 92,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Beri tahu tentang buah-buahan yang sehat, mengetahui kesehatan dan keamanan buahan yang ada di rumah',
                style: TextStyle(
                  color: Color(0xFF2E2E2E),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
