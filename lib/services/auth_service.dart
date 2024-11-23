import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );

  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      print('Google 로그인 시작');

      // 구글 로그인 다이얼로그 표시
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      print('Google 계정 선택 완료: ${googleUser?.email}');

      if (googleUser == null) {
        print('사용자가 로그인을 취소했습니다.');
        return null;
      }

      // 구글 인증 정보 가져오기
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      print('Google 인증 정보 획득 완료');

      // Firebase 인증 정보 생성
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      print('Firebase 인증 정보 생성 완료');

      // Firebase 로그인
      final userCredential = await _auth.signInWithCredential(credential);
      print('Firebase 로그인 완료: ${userCredential.user?.email}');

      return userCredential;
    } catch (e, stackTrace) {
      print('Google 로그인 실패. 상세 에러:');
      print('에러 타입: ${e.runtimeType}');
      print('에러 메시지: $e');
      print('스택 트레이스: $stackTrace');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await Future.wait([
        _auth.signOut(),
        _googleSignIn.signOut(),
      ]);
      print('로그아웃 완료');
    } catch (e) {
      print('로그아웃 실패: $e');
      rethrow;
    }
  }
}
