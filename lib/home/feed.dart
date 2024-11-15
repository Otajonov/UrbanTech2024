import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gallery/galleryimage.dart';
import 'product_details.dart';

class HomeFeedTab extends StatefulWidget {
  const HomeFeedTab({super.key});

  @override
  State<HomeFeedTab> createState() => _HomeFeedTabState();
}

class _HomeFeedTabState extends State<HomeFeedTab> {
  final List<String> imageUrls = [
    "https://tijorat.org/rasm/1.jpg",
    "https://tijorat.org/rasm/2.jpg",
    "https://tijorat.org/rasm/3.jpg",
    "https://tijorat.org/rasm/4.webp",
    "https://tijorat.org/rasm/5.webp",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            isScrollable: true,
            indicatorPadding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: Colors.orange.shade800,
              borderRadius: BorderRadius.circular(25),
            ),
            tabs: const [
              Tab(text: "Cotton"),
              Tab(text: "Leather"),
              Tab(text: "Wood"),
              Tab(text: "Metal"),
              Tab(text: "Plastic"),
              Tab(text: "Glass"),
              Tab(text: "Other"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Cotton Materials
            ListView(
              padding: const EdgeInsets.all(10),
              children: [
                _buildProductCard(
                  context,
                  title: "100% Organic Cotton",
                  rating: 4.5,
                  comments: 15,
                  date: "Nov 12, 2024",
                  description:
                  "Premium organic cotton for textile manufacturing. Perfect for eco-friendly products.",
                  images: [
                    imageUrls[0],
                    imageUrls[1],
                    imageUrls[2],
                    imageUrls[3],
                    imageUrls[4],
                  ],
                ),
                _buildProductCard(
                  context,
                  title: "Soft Cotton Sheets",
                  rating: 4.0,
                  comments: 20,
                  date: "Nov 10, 2024",
                  description:
                  "Soft cotton sheets ideal for bedding and household textiles.",
                  images: [
                    imageUrls[2],
                    imageUrls[3],
                    imageUrls[1],
                    imageUrls[0],
                    imageUrls[4],
                  ],
                ),
                _buildProductCard(
                  context,
                  title: "Durable Cotton Yarn",
                  rating: 4.8,
                  comments: 8,
                  date: "Nov 08, 2024",
                  description:
                  "High-strength cotton yarn suitable for knitting and weaving.",
                  images: [
                    imageUrls[1],
                    imageUrls[0],
                    imageUrls[4],
                    imageUrls[3],
                    imageUrls[2],
                  ],
                ),
                _buildProductCard(
                  context,
                  title: "Bleached Cotton Fabric",
                  rating: 3.5,
                  comments: 12,
                  date: "Nov 06, 2024",
                  description:
                  "Bleached cotton fabric for clothing and industrial use.",
                  images: [
                    imageUrls[3],
                    imageUrls[4],
                    imageUrls[2],
                    imageUrls[0],
                    imageUrls[1],
                  ],
                ),
                _buildProductCard(
                  context,
                  title: "Natural Raw Cotton",
                  rating: 4.2,
                  comments: 25,
                  date: "Nov 05, 2024",
                  description:
                  "Raw cotton directly from farms. Suitable for large-scale textile production.",
                  images: [
                    imageUrls[4],
                    imageUrls[1],
                    imageUrls[3],
                    imageUrls[2],
                    imageUrls[0],
                  ],
                ),
                _buildProductCard(
                  context,
                  title: "Cotton Insulation",
                  rating: 4.1,
                  comments: 10,
                  date: "Nov 04, 2024",
                  description:
                  "Eco-friendly cotton insulation for sustainable building projects.",
                  images: [
                    imageUrls[2],
                    imageUrls[0],
                    imageUrls[3],
                    imageUrls[4],
                    imageUrls[1],
                  ],
                ),
                _buildProductCard(
                  context,
                  title: "Colored Cotton Yarn",
                  rating: 4.7,
                  comments: 18,
                  date: "Nov 03, 2024",
                  description:
                  "Pre-dyed cotton yarn available in various colors. Perfect for artistic projects.",
                  images: [
                    imageUrls[1],
                    imageUrls[4],
                    imageUrls[0],
                    imageUrls[3],
                    imageUrls[2],
                  ],
                ),
                _buildProductCard(
                  context,
                  title: "Cotton for Upholstery",
                  rating: 3.8,
                  comments: 9,
                  date: "Nov 02, 2024",
                  description:
                  "Heavy-duty cotton fabric for furniture upholstery.",
                  images: [
                    imageUrls[3],
                    imageUrls[2],
                    imageUrls[1],
                    imageUrls[0],
                    imageUrls[4],
                  ],
                ),
                _buildProductCard(
                  context,
                  title: "Industrial Cotton Rolls",
                  rating: 4.4,
                  comments: 22,
                  date: "Nov 01, 2024",
                  description:
                  "Large rolls of industrial-grade cotton for bulk use.",
                  images: [
                    imageUrls[0],
                    imageUrls[3],
                    imageUrls[2],
                    imageUrls[4],
                    imageUrls[1],
                  ],
                ),
                _buildProductCard(
                  context,
                  title: "Cotton Waste for Recycling",
                  rating: 3.6,
                  comments: 14,
                  date: "Oct 30, 2024",
                  description:
                  "Recyclable cotton waste suitable for repurposing into new products.",
                  images: [
                    imageUrls[4],
                    imageUrls[1],
                    imageUrls[0],
                    imageUrls[3],
                    imageUrls[2],
                  ],
                ),
              ],
            ),
            // Leather Materials
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Explore premium leather materials suitable for furniture, accessories, and more.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            // Empty Placeholder Tabs
            for (int i = 0; i < 5; i++)
              Center(
                child: Text(
                  "No materials available in this category yet.",
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
      BuildContext context, {
        required String title,
        required double rating,
        required int comments,
        required String date,
        required String description,
        required List<String> images,
      }) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          // Title and Rating
          ListTile(
            title: Text(title),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Icon(
                        i < rating.round()
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                        size: 12,
                      ),
                    Text(
                      " $rating",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.comment_outlined, size: 14),
                    Text(" $comments"),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time_outlined, size: 16),
                    Text(" $date"),
                  ],
                ),
              ],
            ),
          ),
          // Gallery
          GalleryImage(
            imageUrls: images,
            numOfShowImages: 3,
          ),
          const SizedBox(height: 10),
          // Description
          Text(description),
          const SizedBox(height: 10),
          // Buttons
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                child: const Icon(Icons.favorite_outline, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: Colors.orange.shade800,
                        width: 1,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const ProductDetailsPage()),
                    );
                  },
                  child: const Text(
                    "See Details",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
