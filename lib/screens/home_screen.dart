import 'package:flutter/material.dart';
import 'package:notevault/screens/mood_screen.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/notes_provider.dart';
import '../models/note.dart';
import './to_do_screen.dart';
import './mood_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _contentController = TextEditingController();
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreenContent(),
    ToDoScreen(),
    MoodScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_emotions),
            label: '',
          ),
        ],
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context);

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg_pattern_1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.white.withOpacity(0.2),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text('to your comfort place ❤️',
                          style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                  const Icon(Icons.settings, color: Colors.black54),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _contentController,
                decoration: InputDecoration(
                  hintText: 'Тэмдэглэл бичих...',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.add),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: notesProvider.notes.length,
                itemBuilder: (context, index) {
                  final note = notesProvider.notes[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF33808C),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Гарчиг',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateFormat.MMMd().format(note.timestamp),
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8)),
                              ),
                            ],
                          ),
                          Text(note.mood, style: const TextStyle(fontSize: 24)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
