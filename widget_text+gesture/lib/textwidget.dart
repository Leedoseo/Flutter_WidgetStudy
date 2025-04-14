// 위젯 실습용 파일
import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

void main2() {
  runApp(MyApp2());
}

// 텍스트 관련 위젯
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            "Lee Doseo",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

// 제스처 관련 위젯 - TextButton
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: Text("텍스트 버튼",)
          )
        ),
      ),
    );
  }
}

