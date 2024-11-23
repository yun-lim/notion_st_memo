import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note_model.dart';
import 'auth_service.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  FirestoreService._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _authService = AuthService();

  // 노트 생성
  Future<Note> createNote(
      String title, String content, List<String> mediaUrls) async {
    final userId = _authService.currentUser?.uid;
    if (userId == null) throw Exception('사용자 인증이 필요합니다.');

    final now = DateTime.now();
    final noteData = Note(
      id: '', // Firestore가 자동 생성
      title: title,
      content: content,
      mediaUrls: mediaUrls,
      createdAt: now,
      updatedAt: now,
      userId: userId,
    ).toFirestore();

    final docRef = await _firestore.collection('notes').add(noteData);
    return Note.fromFirestore(await docRef.get());
  }

  // 노트 수정
  Future<void> updateNote(Note note) async {
    final userId = _authService.currentUser?.uid;
    if (userId == null) throw Exception('사용자 인증이 필요합니다.');
    if (note.userId != userId) throw Exception('수정 권한이 없습니다.');

    await _firestore.collection('notes').doc(note.id).update(
          note.copyWith(updatedAt: DateTime.now()).toFirestore(),
        );
  }

  // 노트 삭제
  Future<void> deleteNote(String noteId) async {
    final userId = _authService.currentUser?.uid;
    if (userId == null) throw Exception('사용자 인증이 필요합니다.');

    final noteDoc = await _firestore.collection('notes').doc(noteId).get();
    if (!noteDoc.exists) throw Exception('존재하지 않는 노트입니다.');

    final note = Note.fromFirestore(noteDoc);
    if (note.userId != userId) throw Exception('삭제 권한이 없습니다.');

    await _firestore.collection('notes').doc(noteId).delete();
  }

  // 사용자의 모든 노트 가져오기
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
