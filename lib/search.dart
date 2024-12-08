import 'package:flutter/material.dart';

void main() {
  runApp(MusicMastiApp());
}

class MusicMastiApp extends StatelessWidget {
  const MusicMastiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MusicMasti',
      home: MusicMastiSearchScreen(),
    );
  }
}

class MusicMastiSearchScreen extends StatefulWidget {
  const MusicMastiSearchScreen({super.key});

  @override
  _MusicMastiSearchScreenState createState() =>
      _MusicMastiSearchScreenState();
}

class _MusicMastiSearchScreenState extends State<MusicMastiSearchScreen> {
  final List<Map<String, String>> allTracks = [
    {'image': 'assets/images/kk/kk.jpg', 'name': 'KK Song 1'},
    {'image': 'assets/images/kk/kksong2.jpg', 'name': 'KK Song 2'},
    {'image': 'assets/images/diljit/soorma.jpg', 'name': 'Soorma'},
    {'image': 'assets/images/diljit/putt.jpg', 'name': 'Putt Jatt Da'},
    {'image': 'assets/images/yoyo/blueeyes.jpg', 'name': 'Blue Eyes'},
    {'image': 'assets/images/yoyo/brownrang.jpg', 'name': 'Brown Rang'},
    {'image': 'assets/images/yoyo/desikalakar.jpg', 'name': 'Desi Kalakar'},
  ];

  List<Map<String, String>> searchResults = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchResults = allTracks;
  }

  void _searchTracks(String query) {
    final results = allTracks
        .where((track) => track['name']!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Search Music',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: searchController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search for songs or artists...',
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (query) => _searchTracks(query),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final track = searchResults[index];
                  return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Playing ${track['name']}')),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.grey[850]!, Colors.grey[900]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(track['image']!),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              track['name']!,
                              style: const TextStyle(color: Colors.white, fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
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
