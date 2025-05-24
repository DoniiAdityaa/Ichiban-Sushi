import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildRestoranCard({
  required String imagePath,
  required String title,
  required String rating,
  required BuildContext context,
  required String mapsUrl,
}) {
  final screenWidth = MediaQuery.of(context).size.width;

  return GestureDetector(
    onTap: () async {
      final uri = Uri.parse(mapsUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tidak bisa membuka Google Maps')),
        );
      }
    },
    child: Container(
      width: screenWidth,
      decoration: BoxDecoration(
        color: const Color(0xFF23262F),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imagePath,
              width: screenWidth,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 14),
                Text(rating, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
