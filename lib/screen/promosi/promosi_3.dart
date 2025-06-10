import 'package:flutter/material.dart';

class Promosi3 extends StatelessWidget {
  const Promosi3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF2F2F7),
        title: const Text(
          "Promosi 3",
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
                  'assets/promosi4.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Premium Set untuk Buka Puasa yang Berkah! ✨",
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
                  "Rayakan Ramadan dengan kelezatan istimewa dari Premium Set terbaru Ichiban Sushi! Pilihan menu Hotplate & Bento dengan sensasi rasa yang kaya dan premium, khusus untuk Ichikuma Friends.\n\n"
                  "- Chicken Katsu Hotplate \n"
                  "-Saikoro Hotplate-\n"
                  "Chicken Bulgogi Bento-"
                  "Beef Bulgogi Bento\n\n"
                  "Mulai dari 50 ribu-an aja + GRATIS Ocha! ✨\n\n"
                  "*Menu sementara tersedia di outlet tertentu\n\n"
                  "Buka puasa jadi lebih spesial dengan hidangan premium yang bikin puas! Yuk, nikmati momen Ramadan penuh kelezatan di Ichiban Sushi! 🍣🌙\n\n",
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.7,
                    color: Colors.black87,
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
