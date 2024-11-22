import 'package:flutter/material.dart';
import '../models/note_model.dart';
import '../widgets/note_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<Note> _getDummyNotes() {
    return [
      Note(
        id: '1',
        title: '샘플 노트 1',
        content: '이것은 첫 번째 샘플 노트입니다.',
        mediaUrls: [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        userId: 'dummy-user',
      ),
      Note(
        id: '2',
        title: '샘플 노트 2',
        content: '이것은 두 번째 샘플 노트입니다. 좀 더 긴 내용을 가지고 있습니다.',
        mediaUrls: [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        userId: 'dummy-user',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final notes = _getDummyNotes();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteCard(note: notes[index]);
        },
      ),
    );
  }
}
