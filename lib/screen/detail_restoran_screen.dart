import 'package:flutter/material.dart';

class DetailRestoranScreen extends StatelessWidget {
  const DetailRestoranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detail Restoran'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Text('Detail Restoran', style: TextStyle(color: Colors.amber)),
      ),
    );
  }
}
