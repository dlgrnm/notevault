import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/notes_provider.dart';
import '../models/note.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _moodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Notes and Mood Tracker')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notesProvider.notes.length,
              itemBuilder: (context, index) {
                final note = notesProvider.notes[index];
                return ListTile(
                  title: Text(note.content),
                  subtitle: Text(
                    '${note.mood} - ${DateFormat.yMd().add_jm().format(note.timestamp)}',
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      notesProvider.deleteNoteById(note.id!);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _contentController,
                  decoration: InputDecoration(labelText: 'Note Content'),
                ),
                TextField(
                  controller: _moodController,
                  decoration: InputDecoration(labelText: 'Mood'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_contentController.text.isNotEmpty &&
                        _moodController.text.isNotEmpty) {
                      final newNote = Note(
                        content: _contentController.text,
                        mood: _moodController.text,
                        timestamp: DateTime.now(),
                      );
                      notesProvider.addNote(newNote);
                      _contentController.clear();
                      _moodController.clear();
                    }
                  },
                  child: Text('Add Note'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
