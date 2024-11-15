import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'factory_profile.dart';

class CompaniesListTab extends StatefulWidget {
  const CompaniesListTab({super.key});

  @override
  State<CompaniesListTab> createState() => _CompaniesListTabState();
}

class _CompaniesListTabState extends State<CompaniesListTab> {
  final List<Map<String, dynamic>> companies = [
    {
      "name": "Best Shoes Factory",
      "rating": 4.5,
      "comments": 25,
      "location": "Tashkent, Uzbekistan",
      "image": "https://tijorat.org/rasm/1.jpg",
    },
    {
      "name": "Eco Cotton Mills",
      "rating": 4.2,
      "comments": 18,
      "location": "Andijan, Uzbekistan",
      "image": "https://tijorat.org/rasm/2.jpg",
    },
    {
      "name": "Premium Textiles Co.",
      "rating": 3.9,
      "comments": 30,
      "location": "Samarkand, Uzbekistan",
      "image": "https://tijorat.org/rasm/3.jpg",
    },
    {
      "name": "Silk & Cotton Creations",
      "rating": 4.8,
      "comments": 12,
      "location": "Bukhara, Uzbekistan",
      "image": "https://tijorat.org/rasm/4.webp",
    },
    {
      "name": "Fashion Threads Inc.",
      "rating": 4.0,
      "comments": 20,
      "location": "Khiva, Uzbekistan",
      "image": "https://tijorat.org/rasm/5.webp",
    },
    {
      "name": "Uztex Yarn Co.",
      "rating": 3.7,
      "comments": 15,
      "location": "Namangan, Uzbekistan",
      "image": "https://tijorat.org/rasm/1.jpg",
    },
    {
      "name": "Global Fabrics Ltd.",
      "rating": 4.3,
      "comments": 22,
      "location": "Fergana, Uzbekistan",
      "image": "https://tijorat.org/rasm/2.jpg",
    },
    {
      "name": "Tashkent Looms",
      "rating": 4.1,
      "comments": 19,
      "location": "Tashkent, Uzbekistan",
      "image": "https://tijorat.org/rasm/3.jpg",
    },
    {
      "name": "Andijan Cotton Spinners",
      "rating": 3.6,
      "comments": 10,
      "location": "Andijan, Uzbekistan",
      "image": "https://tijorat.org/rasm/4.webp",
    },
    {
      "name": "Innovative Textiles Hub",
      "rating": 4.7,
      "comments": 35,
      "location": "Nukus, Uzbekistan",
      "image": "https://tijorat.org/rasm/5.webp",
    },
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
              borderRadius: BorderRadius.circular(25), // Circular shape for bubble
            ),
            tabs: const [
              Tab(text: "Textile"),
              Tab(text: "Bakery"),
              Tab(text: "Industry 2"),
              Tab(text: "Industry 3"),
              Tab(text: "Industry 4"),
              Tab(text: "Industry 5"),
              Tab(text: "Industry 6"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Textile Industry Companies
            ListView.builder(
              itemCount: companies.length,
              itemBuilder: (context, index) {
                final company = companies[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const FactoryProfilePage(),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(company["image"]),
                    ),
                    title: Text(
                      company["name"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            const SizedBox(width: 4),
                            Text("${company["rating"]}"),
                            const SizedBox(width: 8),
                            Icon(Icons.comment_outlined, size: 14),
                            const SizedBox(width: 4),
                            Text("${company["comments"]}"),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 16),
                            const SizedBox(width: 4),
                            Text(company["location"]),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // Placeholder for other industries
            for (int i = 0; i < 6; i++)
              Center(
                child: Text(
                  "No companies listed for this industry yet.",
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
