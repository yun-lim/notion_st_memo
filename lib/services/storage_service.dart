import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'auth_service.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final AuthService _authService = AuthService();
  final _uuid = const Uuid();

  Future<String> uploadImage(File file) async {
    try {
      final userId = _authService.currentUser?.uid;
      if (userId == null) throw Exception('사용자 인증이 필요합니다.');

      // 파일 확장자 추출
      final extension = file.path.split('.').last;

      // 고유한 파일명 생성
      final fileName = '${_uuid.v4()}.$extension';

      // 저장 경로 설정
      final path = 'images/$userId/$fileName';

      // 파일 업로드
      final ref = _storage.ref().child(path);
      final uploadTask = ref.putFile(file);

      // 업로드 완료 대기 및 URL 반환
      final snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw Exception('이미지 업로드 실패: $e');
    }
  }

  Future<void> deleteImage(String imageUrl) async {
    try {
      final ref = _storage.refFromURL(imageUrl);
      await ref.delete();
    } catch (e) {
      throw Exception('이미지 삭제 실패: $e');
    }
  }
}
