# project-overview (프로젝트 개요)
- Notion 스타일의 모바일 메모 앱 개발
- Flutter/Dart를 사용한 크로스 플랫폼 앱
- Firebase 기반의 백엔드 서비스 활용
- MVP 단계에서 핵심 기능 중심 구현

# feature-requirements (기능 요구사항)
### 1. 메모 관리 기능 ⚠️
- [x] 텍스트 메모 UI 구현 ✅
- [x] 메모 CRUD 기능 ✅
- [x] 이미지 선택 UI 구현 ✅
- [x] 이미지 업로드/저장 ✅

### 2. 홈 화면 ✅
- [x] 메모 리스트 카드 형식 표시
- [x] 하단 네비게이션 바 구현
- [x] Material Design 기반 UI

### 3. 검색 기능 ⚠️
- [x] 검색 UI 구현 ✅
- [x] 로컬 검색 기능 ✅
- [x] 서버 연동 검색 ✅

### 4. 소셜 로그인 ✅
- [x] Google 로그인 연동
- [x] Firebase Auth 연동

# Current-file-instruction (현재 파일 구조)
```
lib/
├── screens/
│   ├── home_screen.dart ✅
│   ├── search_screen.dart ✅
│   ├── create_note_screen.dart ✅
│   └── login_screen.dart ✅
├── models/
│   └── note_model.dart ✅
├── services/
│   ├── auth_service.dart ✅
│   ├── firestore_service.dart ✅
│   └── storage_service.dart ✅
├── widgets/
│   └── note_card.dart ✅
└── main.dart ✅
```

# Tasks (작업)
### 완료된 작업 ✅
1. **기본 UI 구현**
   - [x] 홈 화면 레이아웃
   - [x] 메모 카드 디자인
   - [x] 검색 화면
   - [x] 메모 작성 화면
   - [x] 하단 네비게이션

2. **Firebase 연동**
   - [x] Firebase 초기화
   - [x] Authentication 설정
   - [x] Firestore 연동
   - [x] Storage 연동

3. **데이터 연동**
   - [x] 메모 CRUD 구현
   - [x] 실시간 데이터 동기화
   - [x] 이미지 업로드/다운로드
   - [x] 검색 기능 서버 연동

### 진행할 작업 ⚠️
1. **UI/UX 개선**
   - [ ] 다크 모드 지원
   - [ ] 애니메이션 효과 추가
   - [ ] 사용자 설정 기능

2. **추가 기능**
   - [ ] 메모 공유 기능
   - [ ] 오프라인 지원
   - [ ] 백업/복원 기능