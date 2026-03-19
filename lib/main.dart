import 'package:flutter/material.dart';

void main() {
  runApp(const PontBazarApp());
}

class PontBazarApp extends StatelessWidget {
  const PontBazarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pont Bazar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const PontBazarHomeScreen(),
    );
  }
}

class PontBazarHomeScreen extends StatelessWidget {
  const PontBazarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pont Bazar'),
        actions: const [
          Icon(Icons.notifications_none),
          SizedBox(width: 8),
          Icon(Icons.message_outlined),
          SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // সার্চ বার
          Container(
            color: Colors.orange,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, size: 20, color: Colors.grey),
                        SizedBox(width: 8),
                        Text(
                          'প্রোডাক্ট সার্চ করুন',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.qr_code_scanner,
                    size: 22,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          // ক্যাটাগরি + প্রোডাক্ট লিস্টের জন্য প্লেসহোল্ডার
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                const Text(
                  'ক্যাটাগরি',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    _CategoryChip(icon: '📱', label: 'ইলেকট্রনিক্স'),
                    _CategoryChip(icon: '👕', label: 'ফ্যাশন'),
                    _CategoryChip(icon: '🏠', label: 'হোম'),
                    _CategoryChip(icon: '📦', label: 'হোলসেল'),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'আজকের ডিল',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                _ProductCard(
                  name: 'ব্ল্যাক জিন্স প্যান্ট',
                  price: 1000,
                  oldPrice: 1200,
                ),
                _ProductCard(
                  name: 'সাদা জিন্স প্যান্ট',
                  price: 950,
                  oldPrice: 1100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String icon;
  final String label;

  const _CategoryChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            borderRadius: BorderRadius.circular(24),
          ),
          alignment: Alignment.center,
          child: Text(
            icon,
            style: const TextStyle(fontSize: 22),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 11),
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String name;
  final int price;
  final int oldPrice;

  const _ProductCard({
    required this.name,
    required this.price,
    required this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: const BoxDecoration(
              color: Color(0xFFEDEDED),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.image_outlined,
              size: 32,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '৳$price',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '৳$oldPrice',
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
