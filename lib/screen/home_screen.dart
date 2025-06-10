import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:ksehat/controller/navbar_controller.dart';
import 'package:ksehat/screen/lokasi_screen.dart';
import 'package:ksehat/screen/promosi/promosi_1.dart';
import 'package:ksehat/screen/promosi/promosi_2.dart';
import 'package:ksehat/screen/promosi/promosi_3.dart';
import 'package:ksehat/widget/build_restoran_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'assets/promosi1.png',
      'assets/promosi2.png',
      'assets/promosi4.png',
    ];

    return Scaffold(
      backgroundColor: const Color(
        0xFFF2F2F7,
      ), // Sesuaikan jika pakai tema gelap
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: const Color(0xFFF2F2F7),
              child: Center(
                child: Image.asset(
                  'assets/image.png',
                  height: 35,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 5),
            // Isi scrollable
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Carousel
                    SizedBox(
                      height: 180,
                      child: Swiper(
                        itemCount: imageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              // Navigasi ke halaman sesuai index
                              switch (index) {
                                case 0:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const Promosi1(),
                                    ),
                                  );
                                  break;
                                case 1:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const Promosi2Page(),
                                    ),
                                  );
                                  break;
                                case 2:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const Promosi3(),
                                    ),
                                  );
                                  break;
                              }
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                imageList[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        autoplay: true,
                        viewportFraction: 0.85,
                        scale: 0.9,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Title & "Lihat Menu"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Menu Terbaik',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            navbarIndex.value = 2;
                          },
                          child: const Text(
                            'Lihat Menu',
                            style: TextStyle(
                              color: Color(0xFFFFA000),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Menu Cards Horizontal
                    SizedBox(
                      height: 140,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildMenuCard(
                            'assets/promosi1.png',
                            'Promosi 1',
                            context,
                            const Promosi1(),
                          ),
                          const SizedBox(width: 12),
                          _buildMenuCard(
                            'assets/promosi2.png',
                            'Promosi 2',
                            context,
                            const Promosi2Page(),
                          ),
                          const SizedBox(width: 12),
                          _buildMenuCard(
                            'assets/promosi4.png',
                            'Promosi 3',
                            context,
                            const Promosi3(),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Lokasi Ichiban Sushi',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LokasiScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Lihat Lokasi',
                            style: TextStyle(
                              color: Color(0xFFFFA000),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      children: [
                        buildRestoranCard(
                          imagePath: 'assets/solo_square.png',
                          title: 'Ichiban Sushi - Solo Square',
                          rating: '4.5',
                          context: context,
                          mapsUrl: 'https://maps.app.goo.gl/JSuDgTH6HkWccXR7A',
                        ),
                        const SizedBox(height: 15),
                        buildRestoranCard(
                          imagePath: 'assets/the_park_smg.png',
                          title: 'Ichiban Sushi-The Park Mall Semarang',
                          rating: '4.1',
                          context: context,
                          mapsUrl: 'https://maps.app.goo.gl/2SfFwxdinR6WW4hQ8',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    String imagePath,
    String title,
    BuildContext context,
    Widget targetScreen,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => targetScreen),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              width: 110,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
