# project-overview (프로젝트 개요)
- Notion 스타일의 모바일 메모 앱 개발
- Flutter/Dart를 사용한 크로스 플랫폼 앱
- Firebase 기반의 백엔드 서비스 활용
- MVP 단계에서 핵심 기능 중심 구현

# feature-requirements (기능 요구사항)
### 1. 메모 관리 기능
- 텍스트 메모 작성/수정/삭제
- 이미지/영상 첨부 기능
- 실시간 저장

### 2. 홈 화면
- 메모 리스트 카드 형식 표시
- 클릭 시 수정 모드 전환
- Material Design 기반 UI

### 3. 검색 기능
- 실시간 키워드 검색
- 제목/내용 기반 검색
- 검색 결과 필터링

### 4. 소셜 로그인
- Google/Apple/Facebook 로그인 지원
- Firebase Authentication 연동

# relevant-codes (관련 코드)
### 주요 위젯 및 컴포넌트
```dart
// 메모 카드 위젯
class NoteCard extends StatelessWidget {
  // 메모 표시 카드 구현
}

// 검색바 위젯
class SearchBar extends StatelessWidget {
  // 검색 기능 구현
}

// 메모 작성 폼
class NoteForm extends StatefulWidget {
  // 메모 입력/수정 폼 구현
}
```

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

# rules (규칙)
1. **코드 스타일** ✅
   - [x] 일관된 코드 포맷팅 유지
   - [x] 명확한 변수/함수명 사용
   - [x] 주석 작성

2. **UI/UX 규칙** ✅
   - [x] Notion 스타일 디자인 준수
   - [x] Material Design 가이드라인 따르기
   - [x] 최소한의 컬러 사용

3. **성능 최적화** ✅
   - [x] 이미지 최적화
   - [x] 메모리 누수 방지
   - [x] 부드러운 애니메이션 구현

# Tasks (작업)
### Phase 1: 기본 구조 설정 ✅
- [x] 프로젝트 초기 설정
- [x] Firebase 연동
- [x] 기본 파일 구조 생성

### Phase 2: 핵심 기능 구현 ✅
- [x] 메모 CRUD 기능
- [x] Google 로그인
- [x] 검색 기능

### Phase 3: UI/UX 개발 ✅
- [x] 홈 화면 레이아웃
- [x] 메모 카드 디자인
- [x] 검색바 구현

### Phase 4: 미디어 기능 ✅
- [x] 이미지 업로드
- [ ] 비디오 업로드
- [x] 미디어 최적화

### 남은 작업
1. **로그인 방식**
   - [x] Google 로그인 구현

2. **미디어 기능 확장**
   - [ ] 비디오 업로드/재생
   - [ ] 미디어 파일 크기 최적화
   - [ ] 오프라인 캐싱

3. **UI/UX 개선**
   - [ ] 다크 모드 지원
   - [ ] 애니메이션 효과 추가
   - [ ] 사용자 설정 기능