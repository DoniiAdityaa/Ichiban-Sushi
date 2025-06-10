import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Text(
                "🍣 Ichiban Sushi",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Katalog menu dan fitur favorit untuk restoran Ichiban Sushi.",
              textAlign: TextAlign.center,
            ),
            Divider(height: 32),

            Text(
              "👨‍💻 Pengembang",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Nama: Doni Aditya\nDibuat untuk: Tugas Mobile Programming\nTahun: 2025",
            ),

            SizedBox(height: 16),
            Text(
              "🛠️ Teknologi",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Flutter (Dart), Visual Studio Code"),

            SizedBox(height: 16),
            Text("🏫 Sekolah", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("SMK NEGERI 1 BANGSRI"),
            SizedBox(height: 16),
            Text("🏀 Hobi", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              "Hobi yang saya sukai renang,\nnonton film terbaru,\ndan makan",
            ),
          ],
        ),
      ),
    );
  }
}
