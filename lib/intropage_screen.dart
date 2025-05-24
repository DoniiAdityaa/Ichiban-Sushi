import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroContent extends StatelessWidget {
  final String lottieUrl;
  final String title;
  final String description;

  const IntroContent({
    super.key,
    required this.lottieUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1C1F2A),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            child: Center(child: Lottie.network(lottieUrl, width: 270)),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 92,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                description,
                style: const TextStyle(
                  color: Color(0xFFD9D9D9),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 70), // total tambahan spacing (30 + 40)
        ],
      ),
    );
  }
}
