import 'package:flutter/material.dart';

class TravelHomePage extends StatelessWidget {
  const TravelHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Explore",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/150?img=3",
              ),
            ),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Greeting
            const Text(
              "Hi Rubina 👋",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            /// Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Search destination",
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Categories
            const Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  categoryChip("Beach"),
                  categoryChip("Mountain"),
                  categoryChip("City"),
                  categoryChip("Desert"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Popular Section
            const Text(
              "Popular Places",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  PlaceCard(
                    image: "https://picsum.photos/200/300",
                    title: "Maldives",
                  ),
                  PlaceCard(
                    image: "https://picsum.photos/201/300",
                    title: "Switzerland",
                  ),
                  PlaceCard(
                    image: "https://picsum.photos/202/300",
                    title: "Dubai",
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

/// Category Chip Widget
Widget categoryChip(String title) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}

/// Place Card Widget
class PlaceCard extends StatelessWidget {
  final String image;
  final String title;

  const PlaceCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}