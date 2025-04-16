// import "package:프로젝트이름/lib폴더로부터의 위치/파일명"; 순으로 넣어주면됨
import "package:webapp_practice_project/screen/home_screen.dart"; // home_screen.dart 파일에 있는 HomeScreen 위젯을 불러옴
import 'package:flutter/material.dart'; // Flutter의 머터리얼 디자인 위젯들을 사용하기 위한 패키지

void main() {

  // 플러터 프레임워크가 앱을 실행할 준비가 될 때까지 기다림
  // -> WebViewController 같은 일부 Flutter 기능을 사용하려면, Flutter 엔진이 완전히 초기화된 상태여야 함.
  // -> 아직 바인딩이 초기화되지 않았으면 초기화 해줌!
  // 그럼 지금 왜넣음?
  // -> 지금 코드에서는 WebViewController()를 직접 main() 안에서 쓰진 않지만,
  // 혹시 나중에 main() 안에서 비동기 코드나 WebView 관련 초기화 작업을 넣게 되면, 미리 바인딩을 보장하는 게 안정성 측면에서 좋기 때문임.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp( // MaterialApp은 앱 전체 설정 담당 (테마, 라우트 등)
      home: HomeScreen(), // home은 앱이 시작될 때 처음 보여줄 위젯을 지정 -> lib/screen/home_screen.dart에 정의된 위젯
    ),
  );
}