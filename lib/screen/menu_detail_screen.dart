import 'package:flutter/material.dart';
import 'package:ksehat/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class MenuDetailScreen extends StatelessWidget {
  final String category;
  const MenuDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final menuItems = _getMenuItems(category);

    return Scaffold(
      backgroundColor: const Color(0xff1C1F2A),
      appBar: AppBar(
        backgroundColor: const Color(0xff1C1F2A),
        title: Text(category, style: const TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Image.asset(
              'assets/${category.toLowerCase().replaceAll(' ', '_')}.png',
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                final favoriteProvider = Provider.of<FavoriteProvider>(context);
                final isFav = favoriteProvider.isFavorite(item);

                return GestureDetector(
                  onTap: () => _showMenuDetailBottomSheet(context, item),
                  child: Card(
                    color: const Color(0xFF2D3246),
                    margin: const EdgeInsets.only(bottom: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item['image'] ?? 'assets/default.png',
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'] ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['description'] ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: isFav ? Colors.red : Colors.white54,
                            ),
                            onPressed: () {
                              favoriteProvider.toggleFavorite(item);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showMenuDetailBottomSheet(
    BuildContext context,
    Map<String, String> item,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 5,
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item['image'] ?? 'assets/default.png',
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      item['name'] ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['description'] ?? '-',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const Divider(height: 24),
                    Text(
                      item['price'] ?? 'Harga tidak tersedia',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  List<Map<String, String>> _getMenuItems(String category) {
    final allItems = {
      'RAMEN': [
        // card 1
        {
          'name': 'Tuna Hotplate Ramen with Mushroom',
          'image': 'assets/ramen1.png',
          'description':
              'Ramen disajikan dengan stik tuna, jamur, paprika, dan bawang bombai di atas hotplate.',
        },
        // card 2
        {
          'name': 'Spicy Ramen',
          'image': 'assets/ramen2.png',
          'description':
              'Ramen kaldu shoyu dengan teriyaki beef dan gilingan ayam pedas.',
        },
        // card 3
        {
          'name': 'Spicy Dry Ramen',
          'image': 'assets/ramen3.png',
          'description':
              'Ramen kering pedas dengan ayam diasinkan, telur, nori dan bawang goreng.',
        },
        // card 4
        {
          'name': 'Spicy Beef Ramen With Tori Paitan',
          'image': 'assets/ramen4.png',
          'description':
              'Kuah Tori Paithan pekat dengan irisan daging, ayam bumbu pedas, dan nori.',
        },
        // card 5
        {
          'name': 'Yokohama Spicy Ramen',
          'image': 'assets/ramen5.png',
          'description':
              'Ramen mala spesial dengan gyoza kukus, jamur, telur, dan daun bawang.',
        },
        // card 6
        {
          'name': 'Shibuya Black Ramen',
          'image': 'assets/ramen9.png',
          'description':
              'Ramen dengan ayam yang diasinkan, kaldu wijen hitam bawang putih spesial, tumis jamur, dan telur.',
        },
        // card 7
        {
          'name': 'Sapporo Spicy Ramen',
          'image': 'assets/ramen6.png',
          'description':
              'Ramen kaldu ayam pedas dengan irisan ayam, telur, jamur, narutomaki, dan bawang daun.',
        },
        // card 8
        {
          'name': 'Sapporo Garlic Sesame Ramen',
          'image': 'assets/ramen7.png',
          'description':
              'Ramen kuah ayam spesial dengan cara dipanggang, irisan daging ayam, telur, jamur, dan bawang bombai.',
        },
        // Ganti Topik
      ],
      'NIMURA': [
        {'name': 'Tuna Lava Bomb', 'image': 'assets/nimura1.png'},
        {'name': 'Tuna Bomb', 'image': 'assets/nimura2.png'},
        {
          'name': 'Tamago Sushi Ball',
          'description':
              'Nasi sushi dengan potongan telur dadar gulung, mayonnes dan telur ikan.',
          'image': 'assets/nimura3.png',
        },
        {
          'name': 'Tamago Crispy Tartar',
          'description':
              'Telur crispy dan saus tartar dengan mayonnase taburan katsuobushi dan telur ikan.',
          'image': 'assets/nimura4.png',
        },
        {
          'name': 'Tamago Crispy Mayo',
          'description':
              'Telur crispy ala jepang dengan mayonnase taburan katsuobushi dan telur ikan.',
          'image': 'assets/nimura5.png',
        },
        {
          'name': 'Osaka Roll',
          'description': 'Nasi sushi, ekor kuning, tuna, alpukat & masago.',
          'image': 'assets/nimura6.png',
        },
        {'name': 'Kani Kappa Makki', 'image': 'assets/nimura7.png'},
        {
          'name': 'Kani Bon Roll',
          'description':
              'Nasi sushi dibuat dari cincangan kepiting mayonnes dan irisan nori kering.',
          'image': 'assets/nimura8.png',
        },
        {
          'name': 'Kaisen Roll',
          'description':
              'Nasi sushi, maguro Tuna, albacore, salmon sashimi, mentimun, wijen',
          'image': 'assets/nimura9.png',
        },
        {
          'name': 'Dynamite Roll',
          'description':
              'nasi, kerang, udang, telur udang, yang dibalut dengan keju panggang yang creamy dan gurih.',
          'image': 'assets/nimura10.png',
        },
        {
          'name': 'Dori Bon Roll',
          'description':
              'Nasi sushi dibuat dari potongan dori mayonnes dan irisan nori kering.',
          'image': 'assets/nimura11.png',
        },
        {
          'name': 'Crab Crunchy Roll',
          'description': 'Nasi sushi, crab stick , carrot , timun , salad.',
          'image': 'assets/nimura12.png',
        },
      ],
      'RICESET': [
        {
          'name': 'Tempura Karaage Bento',
          'image': 'assets/riceset1.png',
          'description':
              'Tempura Udang, 3 Chicken Karaage, Tempura Kentang Manis , 2 Onion Ring, Selada, dan Nasi',
        },
        {
          'name': 'Salmon Yakiniku Bento',
          'image': 'assets/riceset2.png',
          'description':
              'Salmon Yakiniku, Tempura Kentang Manis, Selada dan Nasi.',
        },
        {
          'name': 'Mini Kuma',
          'image': 'assets/riceset3.png',
          'description':
              'Butter rice gurih, tori karaage dan sayur disajikan dengan piring spesial Mini Kuma.',
        },
        {
          'name': 'Chicken Yakiniku Bento',
          'image': 'assets/riceset4.png',
          'description':
              'Ayam Yakiniku, Tempura Kentang Manis, Selada dan Nasi.',
        },
        {
          'name': 'Chicken Katsu Curry Bento',
          'image': 'assets/riceset5.png',
          'description':
              'Ayam Katsu Kari, Tempura Kentang Manis, Selada dan Nasi.',
        },
        {
          'name': 'Chicken Goma Bento',
          'image': 'assets/riceset6.png',
          'description':
              'Ayam gurih dengan siraman saus keju, Tempura Kentang Manis, Selada dan Nasi.',
        },
        {
          'name': 'Beef Teriyaki Bento',
          'image': 'assets/riceset7.png',
          'description':
              'Daging Sapi Teriyaki, Tempura Kentang Manis, Selada dan Nasi.',
        },
      ],
      'SUSHI': [
        {
          'name': 'Tuna Tataki',
          'image': 'assets/sushi1.png',
          'description':
              'Ikan Tuna dipanggang ringan, cenderung masih mentah dengan saus namban, wijen, salad saus wakame dan katsuobushi di atasnya.',
        },
        {
          'name': 'Sashimi Set',
          'image': 'assets/sushi2.png',
          'description':
              'Potongan ikan salmon, tuna segar, jellyfish dan baby octopus yang sudah di bumbui.',
        },
        {
          'name': 'Salmon Sashimi',
          'image': 'assets/sushi3.png',
          'description': 'Potongan ikan salmon segar yang diiris tipis.',
        },
        {
          'name': 'Maguro Sashimi',
          'image': 'assets/sushi4.png',
          'description':
              'Ikan Tuna dipanggang ringan, cenderung masih mentah dengan saus namban, wijen, salad saus wakame dan katsuobushi di atasnya.',
        },
        {
          'name': 'Chuka Wakame Sashimi',
          'image': 'assets/sushi5.png',
          'description':
              'Salad dingin rumput laut yang terbuat dari bahan berkualitas tinggi dan diolah secara tradisional.',
        },
        {
          'name': 'Chuka Kurage Sashimi',
          'image': 'assets/sushi6.png',
          'description': 'Jellyfish yang telah diproses dan dibumbui.',
        },
        {
          'name': 'Chuka Idako Sashimi',
          'image': 'assets/sushi7.png',
          'description': 'Baby Octopus berkalori rendah.',
        },
      ],
      'NIGIRISUSHI': [
        {
          'name': 'Tuna Mentai Sushi',
          'image': 'assets/nigiri1.png',
          'description':
              'Nasi sushi dibuat dengan ikan tuna, telur ikan dan mayonaise berbumbu.',
        },
        {
          'name': 'Tobiko Sushi',
          'image': 'assets/nigiri2.png',
          'description':
              'Telur ikan dengan Nasi Sushi yang digulung dalam Nori..',
        },
        {
          'name': 'Tobiko Inari',
          'image': 'assets/nigiri3.png',
          'description':
              'Telur ikan dengan Nasi Sushi yang digulung dalam kulit tahu jepang.',
        },
        {
          'name': 'Tekka Makki',
          'image': 'assets/nigiri4.png',
          'description':
              'Classic roll nasi dengan isian tuna yang digulung dengan nori.',
        },
        {
          'name': 'Tamago Sushi',
          'image': 'assets/nigiri5.png',
          'description':
              'Nasi sushi yang dibungkus dengan omelet Telur dadar gulung Jepang.',
        },
        {
          'name': 'Tamago Mentai Sushi',
          'image': 'assets/nigiri6.png',
          'description':
              'Nasi Sushi terdiri dari tamago (telur dadar khas Jepang), mentai (telur ikan cod pedas).',
        },
        {
          'name': 'Spicy Tuna Roll',
          'image': 'assets/nigiri7.png',
          'description':
              'Classic roll dengan isian nasi sushi dan tuna pedas yang digulung dengan nori.',
        },
        {
          'name': 'Salmon Sushi',
          'image': 'assets/nigiri8.png',
          'description': 'Salmon dengan nasi sushi.',
        },
        {
          'name': 'Salmon Sakura',
          'image': 'assets/nigiri9.png',
          'description': 'Salmon dengan mayones, wijen hitam dan nasi sushi.',
        },
        {
          'name': 'Salmon Roll',
          'image': 'assets/nigiri1.png',
          'description':
              'Classic roll dari nasi sushi dan Salmon yang digulung dengan Nori.',
        },
        {
          'name': 'Roasted Salmon Sushi',
          'image': 'assets/nigiri11.png',
          'description': 'Setengah kematangan salmon dengan nasi sushi.',
        },
        {
          'name': 'Maguro Sushi',
          'image': 'assets/nigiri12.png',
          'description': 'Tuna dengan nasi sushi.',
        },
      ],
      'DONBURI': [
        {
          'name': 'Spicy Beef Donburi',
          'description':
              'Nasi dengan daging tipis pedas yang ditumis kecoklatan.',
          'image': 'assets/donburi1.png',
        },
        {
          'name': 'Salmon Teriyaki Donburi',
          'description': 'Salmon Teriyaki, Vegetables, Rice.',
          'image': 'assets/donburi2.png',
        },
        {
          'name': 'Omellete Curry Donburi',
          'description':
              'Nasi, sayuran, dan telur yang disiram dengan bumbu kari.',
          'image': 'assets/donburi3.png',
        },
        {
          'name': 'Namazu Donburi',
          'description':
              'Nasi dengan olahan daging lele teriyaki, telor omellete dan seaweed.',
          'image': 'assets/donburi4.png',
        },
        {
          'name': 'Karaage Mentai Donburi',
          'description': 'Nasi, chicken karaage, dengan aburi mentai sauce.',
          'image': 'assets/donburi5.png',
        },
        {
          'name': 'Ichi Mentai Don',
          'description':
              'Nasi, salmon asli dan kani (crabstick)dicampur dengan saus mentai gurih.',
          'image': 'assets/donburi6.png',
        },
        {
          'name': 'Hokkaido Dori Donburi',
          'description': 'Nasi dengan ikan dori bertopping olahan protein.',
          'image': 'assets/donburi7.png',
        },
        {
          'name': 'Hokkaido Chicken Donburi',
          'description': 'Nasi dengan ayam bertopping olahan protein.',
          'image': 'assets/donburi8.png',
        },
        {
          'name': 'Hokkaido Beef Donburi',
          'description': 'Nasi dengan beef bertopping olahan protein.',
          'image': 'assets/donburi9.png',
        },
        {
          'name': 'Gyu Tojji Donburi Manis',
          'description':
              'Nasi dengan potongan daging sapi manis dicampur dengan daun bawang dan telur di atasnya.',
          'image': 'assets/donburi10.png',
        },
        {
          'name': 'Gyu Toji Donburi',
          'description':
              'Beef dengan rasa manis /gurih, Telur, Sayuran dan Nasi.',
          'image': 'assets/donburi11.png',
        },
        {
          'name': 'Dory Katsu Donburi',
          'description': 'Nasi dan Dory katsu dengan telur Urak-arik.',
          'image': 'assets/donburi12.png',
        },
      ],
      'TEPPANYAKI': [
        {
          'name': 'Salmon Teppanyaki + Gohan',
          'description': 'Salmon Teppanyaki, Tofu & Tumisan Sayur, dan Nasi',
          'image': 'assets/teppanyaki1.png',
        },
        {
          'name': 'Salmon Teppanyaki',
          'description': 'Salmon Teppanyaki, Tofu & Tumisan Sayur.',
          'image': 'assets/teppanyaki2.png',
        },
        {
          'name': 'Chicken Teppanyaki + Gohan',
          'description':
              'Chicken Teppanyaki, Tofu & amp, Tumisan Sayur, dan Nasi',
          'image': 'assets/teppanyaki3.png',
        },
        {
          'name': 'Chicken Teppanyaki',
          'description': 'Chicken Teppanyaki, Tofu & amp, Tumisan Sayur.',
          'image': 'assets/teppanyaki4.png',
        },
        {
          'name': 'Beef Teppanyaki + Gohan',
          'description': 'Beef Teppanyaki, tofu, sayuran, dan nasi',
          'image': 'assets/teppanyaki5.png',
        },
        {
          'name': 'Beef Teppanyaki',
          'description': 'Beef Teppanyaki, tofu, sayuran.',
          'image': 'assets/teppanyaki6.png',
        },
      ],
      'SUSHIATTACK': [
        {
          'name': 'Sushi Attack Wakamura',
          'description':
              'Terdiri dari : - 4 pcs Shiro Roll - 4 pcs Aka roll - 4 pcs Crunch roll - 4 pcs Kara Kani Roll',
          'image': 'assets/attack1.png',
        },
        {
          'name': 'Sushi Attack Nimura',
          'description':
              'Terdiri dari : - 4 Chicken Sushi Ball - 4 Kani Bon Roll - 4 Dynamite Roll - 4 Kaisen Roll',
          'image': 'assets/attack2.png',
        },
        {
          'name': 'Sushi Attack Ichimura',
          'description':
              'Terdiri dari : - 4 pcs spicy chicken fried roll - 4 pcs kyuri tobiko roll - 4 tamago mentai roll - 4 crispy crab stick roll',
          'image': 'assets/attack3.png',
        },
        {
          'name': 'Sushi Attack Ichikuma',
          'description':
              'Terdiri dari : - 4 pcs spicy chicken roll - 4 pcs california roll - 4 pcs top gun - 4 pcs katsu roll',
          'image': 'assets/attack4.png',
        },
        {
          'name': 'Sushi Attack Ganbatte',
          'description':
              'Terdiri dari : - 2 pcs sushi ball salmon - 2 pcs sushi ball tuna - 4 pcs tamago chicken roll - 4 pcs katsu kyuri roll - 4 pcs top gun roll',
          'image': 'assets/attack5.png',
        },
        {'name': 'Platter Ookiikuma 99', 'image': 'assets/attack6.png'},
        {'name': 'Platter Ookiikuma 88', 'image': 'assets/attack7.png'},
      ],
      'SUSHIROLL': [
        {
          'name': 'Volcano Roll',
          'description': 'Abon tuna, crab stick, tamago, mentimun dan mayones',
          'image': 'assets/roll1.png',
        },
        {
          'name': 'Unagi Dragon Ball Roll',
          'description':
              'Unagi panggang, salmon skin, telur ikan, wijen hitam dan saus namban.',
          'image': 'assets/roll2.png',
        },
        {
          'name': 'Tuna Tartar Roll',
          'description': 'Tuna, mentimun, saus tartar dan saus namban.',
          'image': 'assets/roll3.png',
        },
        {
          'name': 'Tuna Mentai Roll',
          'description': 'Nasi sushi dengan tuna, ber-topping saus mentai.',
          'image': 'assets/roll4.png',
        },
        {
          'name': 'Top Gun Roll',
          'description':
              'Crab stick, telur ikan, tempura garing, mentimun dan mayonnes.',
          'image': 'assets/roll5.png',
        },
        {
          'name': 'Sunset Roll',
          'description': 'Salmon, alpukat, tamago, telur ikan dan mayonnes.',
          'image': 'assets/roll6.png',
        },
        {
          'name': 'Spicy Namazu Kani Mayo Roll',
          'description':
              'Namazu, crab stick, bawang merah, peterseli, cabe rawit, telur ikan dan mayones',
          'image': 'assets/roll7.png',
        },
        {
          'name': 'Spicy Creamy Volcano Salmon Roll',
          'description':
              'Abon tuna, potongan salmon, potongan tuna, mayones dan cabai',
          'image': 'assets/roll8.png',
        },
        {
          'name': 'Spicy Creamy Namazu Roll',
          'description':
              'Nasi sushi, lele digulung ditaburi bubuk cabe, wijen dan mayonnes pedas.',
          'image': 'assets/roll9.png',
        },
        {
          'name': 'Spicy Chicken Roll',
          'description': 'Ayam, cabai rawit, telur ikan dan mayonnes.',
          'image': 'assets/roll10.png',
        },
        {
          'name': 'Sapporo Roll',
          'description': 'Salmon, mentimum, telur ikan, dan selada',
          'image': 'assets/roll11.png',
        },
      ],
      'HIDANGAN': [
        {
          'name': 'Wakame Salad',
          'description':
              'Rumput laut, selada, tomat, kubis, mentimun dengan saus wijen',
          'image': 'assets/hidangan1.png',
        },
        {
          'name': 'Tempura Moriawase',
          'description':
              'Makanan dari udang dan sayuran, di goreng dengan balutan tepung, terdiri dari 2 tempura udang, 3 tempura sayuran',
          'image': 'assets/hidangan2.png',
        },
        {
          'name': 'Tempura Karage',
          'description': 'Ayam goreng khas jepang',
          'image': 'assets/hidangan3.png',
        },
        {
          'name': 'Tebasaki',
          'description':
              'Sayap Ayam Jepang dipanggang, renyah dalam saus yang dibuat dengan kecap, cuka, dan gula. Lembab dan lembut di bagian dalam dengan kulit renyah keemasan di bagian luar.',
          'image': 'assets/hidangan4.png',
        },
        {
          'name': 'Takoyaki Crispy',
          'description':
              'Makanan ringan Jepang berbentuk bola crispy yang terbuat dari adonan tepung terigu dan diisi dengan gurita potong dadu, potongan tempura, dan daun bawang',
          'image': 'assets/hidangan5.png',
        },
        {
          'name': 'Takoyaki',
          'description':
              'Makanan ringan Jepang berbentuk bola yang terbuat dari adonan tepung terigu dan diisi dengan gurita potong dadu, potongan tempura,dan daun bawang',
          'image': 'assets/hidangan6.png',
        },
        {
          'name': 'Salmon Salad',
          'description': 'Salmon, rumput laut, selada, mentimun dan saus shoyu',
          'image': 'assets/hidangan7.png',
        },
        {
          'name': 'Miso Soup',
          'description':
              'Sup tradisional Jepang yang terdiri dari kaldu dashi yang dicampur dengan pasta miso lembut',
          'image': 'assets/hidangan8.png',
        },
        {
          'name': 'Kani Cheese Tempura',
          'description':
              'Crab Stick Tempura diisi dengan cheese stick, mentimun, selada, dan topping kesukaanmu',
          'image': 'assets/hidangan9.png',
        },
        {
          'name': 'Gyoza Steamed',
          'description': 'Pangsit ayam Jepang disajikan dengan cara dikukus',
          'image': 'assets/hidangan10.png',
        },
        {
          'name': 'Gyoza Skin Spicy',
          'description':
              'Kulit pangsit Jepang yang terkenal dengan teksturnya yang lembut dan kenyal, digoreng lalu dibalur dengan bubuk cabe.',
          'image': 'assets/hidangan11.png',
        },
        {
          'name': 'Gyoza Skin Ori',
          'description':
              'Kulit pangsit Jepang yang terkenal dengan teksturnya yang lembut dan kenyal.',
          'image': 'assets/hidangan12.png',
        },
      ],
      'BOBASERIES': [
        {
          'name': 'Strawberry Tea Boba Carafe',
          'image': 'assets/bobaseries1.png',
        },
        {'name': 'Strawberry Tea Boba', 'image': 'assets/bobaseries2.png'},
        {'name': 'Orange Tea Boba Carafe', 'image': 'assets/bobaseries3.png'},
        {'name': 'Orange Tea Boba', 'image': 'assets/bobaseries4.png'},
        {'name': 'Mango Tea Boba Carafe', 'image': 'assets/bobaseries5.png'},
        {'name': 'Mango Tea Boba', 'image': 'assets/bobaseries6.png'},
      ],
      'MINUMAN': [
        {
          'name': 'Tea',
          'description': 'Minuman teh yang segar.',
          'image': 'assets/minuman1.png',
        },
        {
          'name': 'Sunrise Mojito',
          'description':
              'Mojito dengan potongan Stroberi dicampur dengan jus buah dan daun mint.',
          'image': 'assets/minuman2.png',
        },
        {
          'name': 'Summer Mojito',
          'description':
              'Mojito (soda) dengan sirup semangka dan perasan lemon.',
          'image': 'assets/minuman3.png',
        },
        {
          'name': 'Orange tea',
          'description':
              'Minuman perpaduan antara teh dan buah jeruk bercita rasa manis.',
          'image': 'assets/minuman4.png',
        },
        {
          'name': 'Orange',
          'description': 'Minuman segar rasa jeruk.',
          'image': 'assets/minuman5.png',
        },
        {
          'name': 'Ocha',
          'description': 'Minuman segar terbuat dari teh hijau.',
          'image': 'assets/minuman6.png',
        },
        {
          'name': 'Mineral Water',
          'description': 'Minuman air segar dalam kemasan botol.',
          'image': 'assets/minuman7.png',
        },
        {
          'name': 'Milo',
          'description': 'Minuman susu cokelat segar.',
          'image': 'assets/minuman8.png',
        },
        {
          'name': 'Mango Tea',
          'description':
              'Minuman perpaduan antara teh dan buah mangga bercita rasa manis.',
          'image': 'assets/minuman9.png',
        },
        {
          'name': 'Lychee Tea',
          'description':
              'Minuman perpaduan antara teh dan buah leci bercita rasa manis.',
          'image': 'assets/minuman10.png',
        },
        {
          'name': 'Lemonade',
          'description': 'Minuman segar yang terbuat dari perasan lemon.',
          'image': 'assets/minuman11.png',
        },
      ],
    };

    return allItems[category] ?? [];
  }
}
