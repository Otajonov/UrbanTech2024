import 'package:flutter/material.dart';

class FactoryProfilePage extends StatefulWidget {
  const FactoryProfilePage({super.key});

  @override
  State<FactoryProfilePage> createState() => _FactoryProfilePageState();
}

class _FactoryProfilePageState extends State<FactoryProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Company Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Profile Image and Badge
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipOval(
                    child: Image.network(
                      "https://tijorat.org/rasm/3.jpg",
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Handle image change logic here
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Name and Verification Badge
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Best Shoes Factory ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.verified,
                  color: Colors.blue,
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Bio and Contact
            const Text(
              "The best shoes manufacturer in the city.\nQuality and comfort guaranteed.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              "+998 12 345 67 89",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            // Followers, Following, and Follow Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    Text(
                      "254",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Products",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(width: 30),
                Column(
                  children: const [
                    Text(
                      "1.2k",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Followers",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(width: 30),
                Column(
                  children: const [
                    Text(
                      "342",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Following",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle follow/unfollow logic
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              ),
              child: const Text("Follow"),
            ),
            const SizedBox(height: 20),
            // TabBar and TabBarView for Product Types
            TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              tabs: const [
                Tab(text: "Fresh"),
                Tab(text: "Repurposed"),
                Tab(text: "Consumables"),
              ],
            ),
            SizedBox(
              height: 400, // Set a fixed height for the TabBarView
              child: TabBarView(
                controller: _tabController,
                children: [
                  // New Products Tab
                  Center(
                    child: Text(
                      "Brand-new products directly produced by the company.",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Repurposed Products Tab
                  Center(
                    child: Text(
                      "Used materials that can be repurposed for other uses.",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Consumables Tab
                  Center(
                    child: Text(
                      "One-time-use resources like oil or materials with limited use.",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
