import "package:webapp_practice_project/screen/home_screen.dart"; // home_screen.dart 파일에 있는 HomeScreen 위젯을 불러옴
import 'package:flutter/material.dart'; // Flutter의 머터리얼 디자인 위젯들을 사용하기 위한 패키지

void main() {
  runApp(
    MaterialApp( // MaterialApp은 앱 전체 설정 담당 (테마, 라우트 등)
      home: HomeScreen(), // home은 앱이 시작될 때 처음 보여줄 위젯을 지정 -> lib/screen/home_screen.dart에 정의된 위젯
    ),
  );
}