import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width; // 직접 너비와 높이를 정의할 경우를 대비한 너비 파라미터
  final double height;

  const Logo({
    super.key,
    this.width = 200,
    this.height = 200,
  });

  @override

  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "asset/img/logo.png",
          width: width,
          height: height,
        ),
        SizedBox(height: 32.0),
        Text("안녕! 나는 너의 친구 AI봇이야! \n나와 대화를 하며 친밀도를 높여보자!",
          textAlign: TextAlign.center,
          style: TextStyle(
          color:Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}