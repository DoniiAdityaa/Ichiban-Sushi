import 'package:flutter/material.dart';

class Promosi1 extends StatelessWidget {
  const Promosi1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF2F2F7),
        title: const Text(
          "Promosi 1",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF2F2F7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.asset(
                  'assets/promosi1.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Lengkapi Liburanmu dengan Menu yang Seru! ✨",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Lengkapi Liburanmu dengan Menu yang Seru! ✨\n\n"
                  "Liburan terasa kurang seru tanpa makanan yang menggugah selera! Saatnya jadi lebih hepi dengan semangkuk ramen spesial dari Ichiban Sushi yang siap bikin harimu makin oishii.\n\n"
                  "Kuah gurih yang creamy, mie kenyal yang slurpy, dan topping melimpah seperti irisan daging juicy, telur setengah matang, narutomaki, serta jagung manis—semuanya berpadu sempurna dalam satu mangkuk kelezatan!\n\n"
                  "Jadi, tunggu apa lagi? Yuk, ajak teman atau keluarga dan cobain ramen favoritmu sekarang di Ichiban Sushi! ❤️",
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.7,
                    color: Colors.black87, // warna abu gelap yang lembut
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
