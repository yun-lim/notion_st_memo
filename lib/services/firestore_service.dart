import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note_model.dart';
import 'auth_service.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _authService = AuthService();

  // 노트 스트림 가져오기
  Stream<List<Note>> getNotes() {
    final userId = _authService.currentUser?.uid;
    if (userId == null) return Stream.value([]);

    return _firestore
        .collection('notes')
        .where('userId', isEqualTo: userId)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Note.fromFirestore(doc)).toList();
    });
  }

  // 노트 생성
  Future<void> createNote(Note note) async {
    await _firestore.collection('notes').add(note.toMap());
  }

  // 노트 업데이트
  Future<void> updateNote(Note note) async {
    await _firestore.collection('notes').doc(note.id).update(note.toMap());
  }

  // 노트 삭제
  Future<void> deleteNote(String noteId) async {
    await _firestore.collection('notes').doc(noteId).delete();
  }

  // 노트 검색
  Stream<List<Note>> searchNotes(String query) {
    final userId = _authService.currentUser?.uid;
    if (userId == null) return Stream.value([]);

    return _firestore
        .collection('notes')
        .where('userId', isEqualTo: userId)
        .orderBy('title')
        .startAt([query])
        .endAt([query + '\uf8ff'])
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) => Note.fromFirestore(doc)).toList();
        });
  }
}
