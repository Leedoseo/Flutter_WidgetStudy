import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100], // 배경색 지정
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
    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text( // 최상단 U&I 텍스트
          "U&I",
        ),
        const SizedBox(height: 16.0),
        Text( // 두 번째 텍스트
          "우리 처음 만난 날"
        ),
        Text( // 임시로 지정한 만난 날짜
          "2024.04.29",
        ),
        const SizedBox(height: 16.0),
        IconButton(
          iconSize: 60.0,
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          "D+365",
        )
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget { // 커플 이미지 위젯 생성
  @override
  Widget build(BuildContext context) {
    return Center( // 이미지 중앙 정렬
      child: Image.asset(
        "asset/img/middle_image.png",
        height: MediaQuery.of(context).size.height/2, // 화면의 반만큼 높이 구현
      )
    );
  }
}