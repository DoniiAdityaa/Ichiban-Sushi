import 'package:flutter/material.dart';
import 'package:ksehat/intro_screen/intro_page_1.dart';
import 'package:ksehat/intro_screen/intro_page_2.dart';
import 'package:ksehat/navbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Page view
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 1);
              });
            },
            children: [IntroPage1(), IntroPage2()],
          ),

          // Dot indicator & button at bottom
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Dot indicator
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 2,
                    effect: ScrollingDotsEffect(
                      activeDotColor: const Color(0xff2e2e2e),
                      dotColor: Colors.grey[400]!,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),

                  // Lanjut / Selesai button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (onLastPage) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Navbar()),
                        );
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(onLastPage ? 'Mulai' : 'Lanjut'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
