import 'package:flutter/material.dart';

void main() {
  runApp(MusicMastiApp());
}

class MusicMastiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MusicMasti',
      home: MusicMastiHomeScreen(),
    );
  }
}

class MusicMastiHomeScreen extends StatelessWidget {
  final List<String> goodEveningTracks = [
    'assets/images/kk/kk.jpg',
    'assets/images/kk/kksong2.jpg',
    'assets/images/kk/kksong3.jpg',
    'assets/images/kk/kksong4.jpg',
    'assets/images/diljit/soorma.jpg',
    'assets/images/diljit/putt.jpg',
  ];

  final List<Map<String, String>> featuredPlaylists = [
    {'image': 'assets/images/yoyo/blueeyes.jpg', 'name': ' BLUE EYES'},
    {'image': 'assets/images/yoyo/brownrang.jpg', 'name': 'BROWN RANG'},
    {'image': 'assets/images/yoyo/desikalakar.jpg', 'name': 'DESI KALAKAR'},
    {'image': 'assets/images/yoyo/kalaaster.jpg', 'name': 'KALAASTER'},
    {'image': 'assets/images/yoyo/jaatmekhma.jpg', 'name': 'JAATMEKHMA'},
  ];

  final List<Map<String, String>> recentlyPlayed = [
    {'image': 'assets/images/diljit/bb3.jpg', 'name': 'BHOOL BHOOLAIYA'},
    {'image': 'assets/images/diljit/lover.jpg', 'name': 'LOVER '},
    {'image': 'assets/images/diljit/goat.jpg', 'name': 'GOAT'},
    {'image': 'assets/images/diljit/naina.jpg', 'name': 'NAINA '},
    {'image': 'assets/images/diljit/stillrollin.jpg', 'name': 'STILL ROLLIN '},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Welcome Back!',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Favorites',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildGoodEveningSection(),
              SizedBox(height: 20),
              Text(
                'Featured Playlists',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildFeaturedPlaylistsCarousel(),
              SizedBox(height: 20),
              Text(
                'Recently Played',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildInteractiveRecentlyPlayed(context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Shuffle Play!')),
          );
        },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.shuffle),
      ),
      bottomNavigationBar: _buildAnimatedBottomNavigationBar(),
    );
  }

  Widget _buildGoodEveningSection() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: goodEveningTracks.length,
        itemBuilder: (context, index) {
          String trackName = "Track ${index + 1}";
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 80, // Reduced width for smaller images
                height: 80, // Reduced height for smaller images
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(goodEveningTracks[index]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(height: 5),
              Text(
                trackName,
                style: TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFeaturedPlaylistsCarousel() {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: featuredPlaylists.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(featuredPlaylists[index]['image']!),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                featuredPlaylists[index]['name']!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black54,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInteractiveRecentlyPlayed(BuildContext context) {
    return Column(
      children: recentlyPlayed.map((track) {
        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Playing ${track['name']}')),
            );
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(10),
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
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    track['name']!,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAnimatedBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.redAccent,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_music),
          label: 'Library',
        ),
      ],
    );
  }
}
