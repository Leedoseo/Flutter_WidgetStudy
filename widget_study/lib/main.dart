import "package:flutter/material.dart";

void main() {
  runApp(
    // child 사용
//     MaterialApp(
//       home: Scaffold(
//         body: Center(
//           // 하나의 위젯만 가능
//           child: Text("Lee Doseo"),
//         ),
//       ),
//     ),
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

          // 여러 위젯을 Column 위젯에 입력 가능
            children: [
              Text("Lee"),
              Text("Doseo"),
            ],
          ),
        ),
      ),
    ),
  );
}