import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/notes_provider.dart';
import '../models/note.dart';

class ToDoScreen extends StatelessWidget {
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context);

    return Scaffold(
      body: Stack(
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
                          'To do list',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text('хийсэн ажлуудаа check-лээрэй ❤️',
                            style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                    const Icon(Icons.settings, color: Colors.black54),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
