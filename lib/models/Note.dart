class Note {
  final int? id;
  final String content;
  final String mood;
  final DateTime timestamp;

  Note({
    this.id,
    required this.content,
    required this.mood,
    required this.timestamp,
  });

  // Convert a Note to a Map to store in SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'mood': mood,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  // Convert a Map from SQLite to a Note
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      content: map['content'],
      mood: map['mood'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
