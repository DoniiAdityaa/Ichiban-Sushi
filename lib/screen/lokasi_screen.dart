import 'package:flutter/material.dart';
import 'package:ksehat/widget/build_restoran_card.dart'; // pastikan ini diimport

class LokasiScreen extends StatefulWidget {
  const LokasiScreen({super.key});

  @override
  State<LokasiScreen> createState() => _LokasiScreenState();
}

class _LokasiScreenState extends State<LokasiScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> lokasiList = [
    {
      'nama': 'Ichiban Sushi - Solo Square',
      'kota': 'solo',
      'url': 'https://maps.app.goo.gl/JSuDgTH6HkWccXR7A',
      'image': 'assets/solo_square.png',
      'rating': '4.5',
    },
    {
      'nama': 'Ichiban Sushi - The Park Semarang',
      'kota': 'semarang',
      'url': 'https://maps.app.goo.gl/2SfFwxdinR6WW4hQ8',
      'image': 'assets/the_park_smg.png',
      'rating': '4.1',
    },
    {
      'nama': 'Ichiban Sushi - DP Mall Semarang',
      'kota': 'semarang',
      'url': 'https://maps.app.goo.gl/6DGP1arJUtybmVm9A',
      'image': 'assets/dpmall.png',
      'rating': '3.4',
    },
    {
      'nama': 'Ichiban Sushi - Mall Ciputra Semarang',
      'kota': 'semarang',
      'url': 'https://maps.app.goo.gl/1FwWbqD3fk6Akv929',
      'image': 'assets/mallciputra_smg.png',
      'rating': '4.0',
    },
    {
      'nama': 'Ichiban Sushi - The Park Mall Solo',
      'kota': 'solo',
      'url': 'https://maps.app.goo.gl/oN5emSS6qUsThfVM7',
      'image': 'assets/thepark_solo.png',
      'rating': '4.2',
    },
    {
      'nama': 'Ichiban Sushi - Java Mall Semarang',
      'kota': 'semarang',
      'url': 'https://maps.app.goo.gl/9bNNNVs5bMXG6g8h8',
      'image': 'assets/javamall_smg.png',
      'rating': '4.2',
    },
    {
      'nama': 'Ichiban Sushi - Rita Supermall Purwokerto',
      'kota': 'Purwokerto',
      'url': 'https://maps.app.goo.gl/EbgSNKebHVEMsVHR8',
      'image': 'assets/supermall_purwokerto.png',
      'rating': '4.0',
    },
    {
      'nama': 'Ichiban Sushi Hartono Mall Sukoharjo',
      'kota': 'sukoharjo',
      'url': 'https://maps.app.goo.gl/fPBz36JtHLoePgZY8',
      'image': 'assets/mall_sukaharjo.png',
      'rating': '4.2',
    },
    {
      'nama': 'Ichiban Sushi - Transmart Pekalongan',
      'kota': 'pekalongan',
      'url': 'https://maps.app.goo.gl/QWnsFjNaB5mU3jMC8',
      'image': 'assets/transmart_pekalongan.png',
      'rating': '3.9',
    },
    {
      'nama': 'Ichiban Sushi - Armada Town Square',
      'kota': 'magelang',
      'url': 'https://maps.app.goo.gl/BtEHB1CHuB7adgQN9',
      'image': 'assets/magelang_sushi.png',
      'rating': '4.5',
    },
    {
      'nama': 'Ichiban Sushi - Transmart Tegal',
      'kota': 'tegal',
      'url': 'https://maps.app.goo.gl/UAAEDDBhhBWytDVEA',
      'image': 'assets/transmart_tegal.png',
      'rating': '4.5',
    },
    {
      'nama': 'Ichiban Sushi',
      'kota': 'tegal',
      'url': 'https://maps.app.goo.gl/wjSgs26ivqbh9G7n6',
      'image': 'assets/tegal.png',
      'rating': '2.9',
    },
    {
      'nama': 'Ichiban Sushi Pakuwon Mall Jogja',
      'kota': 'jogja',
      'url': 'https://maps.app.goo.gl/wmdRDcyscdozC8xo7',
      'image': 'assets/pakuwon_mall_jogja.png',
      'rating': '4.6',
    },
    {
      'nama': 'Ichiban Sushi Plaza Malioboro',
      'kota': 'jogja',
      'url': 'https://maps.app.goo.gl/wmdRDcyscdozC8xo7',
      'image': 'assets/plaza_malioboro.png',
      'rating': '4.5',
    },
    {
      'nama': 'Ichiban Sushi Plaza Ambarrukmo',
      'kota': 'jogja',
      'url': 'https://maps.app.goo.gl/wmdRDcyscdozC8xo7',
      'image': 'assets/ambarukmo_jogja.png',
      'rating': '4.7',
    },
  ];

  List<Map<String, String>> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = lokasiList;
  }

  void _search(String query) {
    setState(() {
      filteredList =
          lokasiList
              .where(
                (item) =>
                    item['kota']!.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      appBar: AppBar(
        title: const Text('Lihat Lokasi'),
        backgroundColor: const Color(0xFFF2F2F7),
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _search,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Cari kota anda...',
                hintStyle: const TextStyle(color: Colors.black54),
                filled: true,
                fillColor: const Color(0xFFE5E5EA),
                prefixIcon: const Icon(Icons.search, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: filteredList.length,
                separatorBuilder: (_, __) => const SizedBox(height: 15),
                itemBuilder: (_, index) {
                  final item = filteredList[index];
                  return buildRestoranCard(
                    imagePath: item['image']!,
                    title: item['nama']!,
                    rating: item['rating']!,
                    context: context,
                    mapsUrl: item['url']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
