import 'package:flutter/material.dart';
import '../models/note_model.dart';
import '../widgets/note_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';
  final List<Note> _dummyNotes = [
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
      content: '이것은 두 번째 샘플 노트입니다.',
      mediaUrls: [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      userId: 'dummy-user',
    ),
  ];

  List<Note> _getFilteredNotes() {
    if (_searchQuery.isEmpty) return [];

    return _dummyNotes.where((note) {
      final title = note.title.toLowerCase();
      final content = note.content.toLowerCase();
      final query = _searchQuery.toLowerCase();
      return title.contains(query) || content.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredNotes = _getFilteredNotes();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: '검색어를 입력하세요',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filteredNotes.length,
        itemBuilder: (context, index) {
          return NoteCard(note: filteredNotes[index]);
        },
      ),
    );
  }
}
