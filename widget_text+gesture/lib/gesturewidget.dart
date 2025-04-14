// 위젯 실습용 파일
import "package:flutter/material.dart";

void main() {
  runApp(MyApp2());
}

void main2() {
  runApp(FloatingActionButtonExample());
}
// 제스처 관련 위젯 - OutlinedButton
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: Text("아웃라인드 버튼",)
            )
        ),
      ),
    );
  }
}

// 제스처 관련 위젯 - ElevatedButton
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text("엘레베이티드 버튼"),
          ),
        ),
      ),
    );
  }
}

// 제스처 관련 위젯 - IconButton
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
              ),
            )
        ),
      ),
    );
  }
}

// 제스처 관련 위젯 - GestureDetector
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: (){
              print("on tap");
            },
            onDoubleTap: (){
              print("on double tap");
            },
            onLongPress: (){
              print("on long press");
            },

            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              width: 100.0,
              height: 100.0,
            ),
          ),
        ),
      ),
    );
  }
}

// 제스처 관련 위젯 - FloatingActionButton
class FloatingActionButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text("클릭"),
        ),
        body: Container(),
      ),
    );
  }
}