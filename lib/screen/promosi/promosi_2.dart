import 'package:flutter/material.dart';

class Promosi2Page extends StatelessWidget {
  const Promosi2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF2F2F7),
        title: const Text(
          "Promosi 2",
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
                  'assets/promosi2.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "MABAR RAMADAN: Solusi Bukber Anti Ribet!",
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
                  "Gak perlu pusing cari menu bukber, Ichiban Sushi punya paket spesial buat kamu! ✨\n\n"
                  "Hemat sampai 40 ribu dan bisa dipesan langsung lewat ShopeeFood, GoFood, dan GrabFood!\n\n"
                  "Yuk, ajak teman-teman Makan Bareng dengan pilihan menu enak yang bikin puas dan pastinya praktis! Jangan sampai ketinggalan, promo ini terbatas lho Ichikuma Friends!",
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
