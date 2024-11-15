import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://tijorat.org/rasm/1.jpg",
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Product Title and Price
            const Text(
              "Cotton Material",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Price: 50 000 UZS per kg (Approximate)",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Seller Information
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://tijorat.org/rasm/1.jpg"),
                  radius: 30,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Best Shoes Factory",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Location: Tashkent, Uzbekistan",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Contact Seller Button
            ElevatedButton.icon(
              onPressed: () {
                // Handle contact seller logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade50,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              icon: const Icon(Icons.chat),
              label: const Text("Contact Seller"),
            ),
            const SizedBox(height: 16),

            // Product Description
            const Text(
              "Product Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "High-quality cotton material directly from our factory. "
                  "Suitable for textile and clothing manufacturing. "
                  "Available in large quantities at competitive prices.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Ratings and Comments Section
            const Text(
              "Ratings & Reviews",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star_half, color: Colors.amber, size: 20),
                Icon(Icons.star_border, color: Colors.amber, size: 20),
                SizedBox(width: 8),
                Text(
                  "3.5 (12 reviews)",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Comments
            const Text(
              "User Comments",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildComment(
              "Jane Doe",
              "Good quality cotton. Very satisfied with the product!",
              "5 days ago",
            ),
            const Divider(),
            _buildComment(
              "Mark Lee",
              "Average quality. Delivery was a bit delayed.",
              "1 week ago",
            ),
            const Divider(),
            _buildComment(
              "Emily Smith",
              "Great cotton for making clothes. Will order again!",
              "2 weeks ago",
            ),
            const SizedBox(height: 16),

            // Order Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle order logic
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Order Now",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComment(String name, String comment, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          comment,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          time,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
