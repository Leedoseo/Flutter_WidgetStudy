import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 디자인 관련 위젯 - Container
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            // 스타일 적용
            decoration: BoxDecoration(
              // 배경색 적용
              color: Colors.red,
              border: Border.all(
                width: 16.0,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(
                16.0,
              ),
            ),
            height: 200.0,
            width: 100.0,
          )
        ),
      ),
    );
  }
}

// 디자인 관련 위젯 - SizedBox
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: SizedBox(
              height: 200.0,
              width: 200.0,

              child: Container(
                color: Colors.red,
              ),
            )
        ),
      ),
    );
  }
}

// 디자인 관련 위젯 - Padding
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Container(
              color: Colors.blue,
              child: Padding(
                // 상하좌우 모두 16픽셀만큼 패딩 적용
                padding: EdgeInsets.all(
                  16.0,
                ),
                child: Container(
                  color: Colors.red,
                  width: 50.0,
                  height: 50.0,
                ),
              )
            )
        ),
      ),
    );
  }
}

// 디자인 관련 위젯 - SafeArea
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          // 원하는 부위만 따로 적용 가능
          top: true,
          bottom: true,
          left: true,
          right: true,
          child: Container(
            color: Colors.red,
            height: 300.0,
            width: 300.0,
          ),
        ),
      ),
    );
  }
}
