import 'package:flutter/material.dart';
import 'package:ksehat/screen/menu_detail_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<Map<String, String>> categories = [
    {'category': 'RAMEN', 'image': 'assets/ramen.png'},
    {'category': 'NIMURA', 'image': 'assets/nimura.png'},
    {'category': 'RICESET', 'image': 'assets/riceset.png'},
    {'category': 'SUSHI', 'image': 'assets/sushi.png'},
    {'category': 'NIGIRISUSHI', 'image': 'assets/nigirisushi.png'},
    {'category': 'DONBURI', 'image': 'assets/donburi.png'},
    {'category': 'TEPPANYAKI', 'image': 'assets/teppanyaki.png'},
    {'category': 'SUSHIATTACK', 'image': 'assets/sushiattack.png'},
    {'category': 'SUSHIROLL', 'image': 'assets/sushiroll.png'},
    {'category': 'HIDANGAN', 'image': 'assets/hidangan.png'},
    {'category': 'BOBASERIES', 'image': 'assets/bobaseries.png'},
    {'category': 'MINUMAN', 'image': 'assets/minuman.png'},
    // Tambahkan kategori lain kalau perlu
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1F2A),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: const Color(0xFFFFC107),
              child: Center(
                child: Image.asset(
                  'assets/image.png',
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children:
                    categories.map((category) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => MenuDetailScreen(
                                    category: category['category']!,
                                  ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  category['image']!,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              category['category']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
