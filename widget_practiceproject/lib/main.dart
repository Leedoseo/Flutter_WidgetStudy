import 'package:flutter/material.dart';

void main() {
  runApp(SplashScreen()); // SplashScreen 위젯을 첫 화면으로 지정
}

class SplashScreen extends StatelessWidget { // StatelessWidget 선언
  @override
  Widget build(BuildContext context) { // 위젯의 UI 구현
    return MaterialApp( // 항상 최상단에 입력되는 위젯
      home: Scaffold( // 항상 두 번째로 입력되는 위젯
        body: Container( // 컨테이너 위젯
          decoration: BoxDecoration(
            color: Color(0xFFB7DAD3) // -> color: Colors.orange를 헥스코드로 바꿈
                                     // 16진수를 의미하는 0x와 불투명도100%인 FF, 그리고 색상코드 6자리를 입력하면됨.
          ),
          child: Column( // Image.asset()처럼 고정된 크기를 가진 위젯을 Column에 넣으면 기본적으로 가로축은 중앙 정렬이 기본
            children: [
              // 여러 위젯을 입력할 수 있는 children 파라미터
              Image.asset(
                "assets/logo.png",
              ),
              CircularProgressIndicator() // 로딩 애니메이션이 실행되는 위젯
            ],
            ),
          ),
        ),
      );
  }
}
