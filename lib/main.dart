import 'package:flutter/material.dart';

import 'account.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
              // Your Favorites Section
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
              // Featured Playlists
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
              // Recently Played Section
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
      bottomNavigationBar: _buildAnimatedBottomNavigationBar(context),
    );
  }

  Widget _buildGoodEveningSection() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 10),
            width: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                'Track ${index + 1}',
                style: TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedPlaylistsCarousel() {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage('https://via.placeholder.com/300'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                'Playlist ${index + 1}',
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
    List<String> recentlyPlayed = [
      'Track 5',
      'Track 4',
      'Track 3',
      'Track 2',
      'Track 1',
    ]; // Recent songs are reversed

    return Column(
      children: recentlyPlayed.map((track) {
        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Playing $track')),
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
                      image: NetworkImage('https://via.placeholder.com/150'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  track,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAnimatedBottomNavigationBar(BuildContext context) {
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
        //Account Icon Added -- Keval Nai
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
      onTap: (index) {
        if (index == 3) {
          // Navigate to the search screen when the search icon is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MusicMastiAccountPage()),
          );
        }
      },
    );
  }
}
