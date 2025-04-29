import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // SafeArea 적용
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 위아래 끝에 위젯 배치
          crossAxisAlignment: CrossAxisAlignment.stretch, // 반대축 최대 크기로 늘리기
          children: [
            _DDay(),
            _CoupleImage(),
          ],
        )
      )
    );
  }
}

class _DDay extends StatelessWidget { // D-day 위젯 생성
  @override
  Widget build(BuildContext context) {
    return Text("DDay Widget");
  }
}

class _CoupleImage extends StatelessWidget { // 커플 이미지 위젯 생성
  @override
  Widget build(BuildContext context) {
    return Text("Couple Image Widget");
  }
}