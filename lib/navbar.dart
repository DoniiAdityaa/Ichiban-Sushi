import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ksehat/controller/navbar_controller.dart'; // ⬅️ Tambahkan ini
import 'package:ksehat/screen/favorite_screen.dart';
import 'package:ksehat/screen/home_screen.dart';
import 'package:ksehat/screen/menu_screen.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  final List<Widget> _screens = const [
    HomeScreen(),
    FavoriteScreen(),
    MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: navbarIndex, // Gunakan controller
      builder: (context, selectedIndex, _) {
        return Scaffold(
          backgroundColor: const Color(0xff1C1F2A),
          body: _screens[selectedIndex],
          bottomNavigationBar: Container(
            color: const Color(0xff1C1F2A),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: GNav(
                //Gnav buat Navbar
                backgroundColor: const Color(0xff1C1F2A),
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Color(0xFF2D3246),
                gap: 15,
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  navbarIndex.value = index; // Ubah index global
                },
                padding: const EdgeInsets.all(16.0),
                tabs: const [
                  GButton(icon: Icons.home_outlined, text: 'Home'),
                  GButton(icon: Icons.favorite_border, text: 'Favorite'),
                  GButton(icon: Icons.menu_book_rounded, text: 'Menu'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
