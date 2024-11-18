import 'package:flutter/material.dart';

void main() {
  runApp(BarbershopApp());
}

class BarbershopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barbershop Booking',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: BarbershopHome(),
    );
  }
}

class BarbershopHome extends StatefulWidget {
  @override
  _BarbershopHomeState createState() => _BarbershopHomeState();
}

class _BarbershopHomeState extends State<BarbershopHome> {
  List<Widget> nearbyBarbershops = [];
  List<Widget> allBarbershops = [];
  bool showAll = false;

  @override
  void initState() {
    super.initState();
    nearbyBarbershops = [
      BarbershopCard(
        name: 'Alana Barbershop',
        rating: 4.5,
        location: 'Banguntapan (5km)',
        imagePath: 'assets/images/alana_barbershop.jpg',
      ),
      BarbershopCard(
        name: 'Hertha Barbershop',
        rating: 5.0,
        location: 'Jalan Kaliurang (8km)',
        imagePath: 'assets/images/hertha_barbershop.jpg',
      ),
      BarbershopCard(
        name: 'Barberking',
        rating: 4.5,
        location: 'Jogja Expo Centre (12km)',
        imagePath: 'assets/images/barberking_barbershop.jpg',
      ),
    ];

    allBarbershops = [
      BarbershopCard(
        name: 'Alana Barbershop',
        rating: 4.5,
        location: 'Banguntapan (5km)',
        imagePath: 'assets/images/alana_barbershop.jpg',
      ),
      BarbershopCard(
        name: 'Hertha Barbershop',
        rating: 5.0,
        location: 'Jalan Kaliurang (8km)',
        imagePath: 'assets/images/hertha_barbershop.jpg',
      ),
      BarbershopCard(
        name: 'Barberking',
        rating: 4.5,
        location: 'Jogja Expo Centre (12km)',
        imagePath: 'assets/images/barberking_barbershop.jpg',
      ),
      BarbershopCard(
        name: 'Blumers Barbershop',
        rating: 4.7,
        location: 'Location (15km)',
        imagePath: 'assets/images/blumers.jpg',
      ),
      BarbershopCard(
        name: 'Paulies Barbershop',
        rating: 4.2,
        location: 'Location (20km)',
        imagePath: 'assets/images/paulies.jpg',
      ),
    ];
  }

  void toggleSeeAll() {
    setState(() {
      showAll = !showAll;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barbershop Booking'),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.orange[200],
                    ),
                    width: double.infinity,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/booking_banner.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Booking Now'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Nearest Barbershop',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: showAll ? allBarbershops : nearbyBarbershops,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextButton(
                onPressed: toggleSeeAll,
                child: Text(showAll ? 'Show Less' : 'See All'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  Text(
                    'Most Recommended',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: buildRecommendationCards(),
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

  List<RecommendationCard> buildRecommendationCards() {
    return [
      RecommendationCard(
        name: 'Masterpiece Barbershop – Haircut styling',
        rating: 5.0,
        location: 'Jogja Expo Centre (2 km)',
        imagePath: 'assets/images/masterpiece_barber.jpg',
      ),
      RecommendationCard(
        name: 'Varcity Barbershop Jogja ex The Varcher',
        rating: 4.5,
        location: 'Condongcatur (10 km)',
        imagePath: 'assets/images/varcity_barber.jpg',
      ),
      RecommendationCard(
        name: 'Twinsky Monkey Barber & Men Stuff',
        rating: 5.0,
        location: 'Jl Taman Siswa (8 km)',
        imagePath: 'assets/images/twinsky_barber.jpg',
      ),
      RecommendationCard(
        name: 'Barberman – Haircut styling & massage',
        rating: 4.5,
        location: 'J-Walk Centre (17 km)',
        imagePath: 'assets/images/barberman.jpg',
      ),
    ];
  }
}

class BarbershopCard extends StatelessWidget {
  final String name;
  final double rating;
  final String location;
  final String imagePath;

  BarbershopCard({
    required this.name,
    required this.rating,
    required this.location,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(imagePath, fit: BoxFit.cover, height: 100, width: 150),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  Text(location, style: TextStyle(fontSize: 10)),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 14),
                      Text('$rating', style: TextStyle(fontSize: 10)),
                    ],
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

class RecommendationCard extends StatelessWidget {
  final String name;
  final double rating;
  final String location;
  final String imagePath;

  RecommendationCard({
    required this.name,
    required this.rating,
    required this.location,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(imagePath, fit: BoxFit.cover, height: 120, width: double.infinity),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  Text(location, style: TextStyle(fontSize: 10)),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 12),
                      Text('$rating', style: TextStyle(fontSize: 8 )),
                    ],
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
