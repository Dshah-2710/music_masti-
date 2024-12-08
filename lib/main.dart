import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
      home: MusicMastiHomeScreen(),
    );
  }
}

class MusicMastiHomeScreen extends StatefulWidget {
  @override
  _MusicMastiHomeScreenState createState() => _MusicMastiHomeScreenState();
}

class _MusicMastiHomeScreenState extends State<MusicMastiHomeScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentSong;
  PlayerState _playerState = PlayerState.stopped;

  final List<String> goodEveningTracks = [
    'assets/images/kk/kk.jpg',
    'assets/images/kk/kksong2.jpg',
    'assets/images/kk/kksong3.jpg',
    'assets/images/kk/kksong4.jpg',
    'assets/images/diljit/soorma.jpg',
    'assets/images/diljit/putt.jpg',
  ];

  final List<Map<String, String>> featuredPlaylists = [
    {'image': 'assets/images/yoyo/blueeyes.jpg', 'name': 'BLUE EYES'},
    {'image': 'assets/images/yoyo/brownrang.jpg', 'name': 'BROWN RANG'},
    {'image': 'assets/images/yoyo/desikalakar.jpg', 'name': 'DESI KALAKAR'},
    {'image': 'assets/images/yoyo/kalaaster.jpg', 'name': 'KALAASTER'},
    {'image': 'assets/images/yoyo/jaatmekhma.jpg', 'name': 'JAATMEKHMA'},
  ];

  final List<Map<String, String>> recentlyPlayed = [
    {'image': 'assets/images/diljit/bb3.jpg', 'name': 'BHOOL BHOOLAIYA', 'path': 'assets/audio/bhoolbholaiya.mp3'},
    {'image': 'assets/images/diljit/lover.jpg', 'name': 'LOVER', 'path': 'assets/audio/lover.mp3'},
    {'image': 'assets/images/diljit/goat.jpg', 'name': 'GOAT', 'path': 'assets/audio/goat.mp3'},
    {'image': 'assets/images/diljit/naina.jpg', 'name': 'NAINA', 'path': 'assets/audio/naina.mp3'},
    {'image': 'assets/images/diljit/stillrollin.jpg', 'name': 'STILL ROLLIN', 'path': 'assets/audio/stillrollin.mp3'},
  ];

  MusicMastiHomeScreen({super.key});

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  // Play or Pause the song
  Future<void> _playPauseSong(String path) async {
    if (_currentSong == path && _playerState == PlayerState.playing) {
      // Pause if the song is already playing
      await _audioPlayer.pause();
      setState(() {
        _playerState = PlayerState.paused;
      });
    } else {
      // Play the selected song
      await _audioPlayer.play(AssetSource(path));
      setState(() {
        _currentSong = path;
        _playerState = PlayerState.playing;
      });
    }
  }

  // Stop the currently playing audio
  Future<void> _stopAudio() async {
    await _audioPlayer.stop();
    setState(() {
      _currentSong = null;
      _playerState = PlayerState.stopped;
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
          'Welcome Back!',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
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
              const Text(
                'Your Favorites',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildGoodEveningSection(),
              const SizedBox(height: 20),
              const Text(
                'Featured Playlists',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildFeaturedPlaylistsCarousel(),
              const SizedBox(height: 20),
              const Text(
                'Recently Played',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildInteractiveRecentlyPlayed(context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _stopAudio,
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.stop),
       
      ),
      bottomNavigationBar: _buildAnimatedBottomNavigationBar(context),
    );
  }

  Widget _buildGoodEveningSection() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: goodEveningTracks.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 80,
                height: 80,

                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(goodEveningTracks[index]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Track ${index + 1}',
                style: TextStyle(color: Colors.white, fontSize: 14),

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
            margin: const EdgeInsets.symmetric(horizontal: 10),
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
                style: const TextStyle(
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
            _playPauseSong(track['path']!);
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
      }).toList(),
    );
  }

  Widget _buildAnimatedBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.redAccent,

      items: const [
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
      onTap: (index) {
        if (index == 1) {
          // Navigate to the search screen when the search icon is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MusicMastiSearchScreen()),
          );
        }
      },
    );
  }
}

class MusicMastiSearchScreen extends StatefulWidget {
  const MusicMastiSearchScreen({super.key});

  @override
  _MusicMastiSearchScreenState createState() => _MusicMastiSearchScreenState();
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
        .where((track) =>
            track['name']!.toLowerCase().contains(query.toLowerCase()))
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
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
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
