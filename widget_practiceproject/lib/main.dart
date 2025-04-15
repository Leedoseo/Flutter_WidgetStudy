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
          child: Center(
            child: Image.asset( // 이전 Text위젯을 Image위젯으로 변경
              "assets/logo.png",
            ),
          ),
        ),
      ),
    );
  }
}
