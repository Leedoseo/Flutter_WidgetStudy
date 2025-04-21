import "package:flutter/material.dart";
import "package:flutter/services.dart"; // 상태바 색상 변경 위한 패키지

class HomeScreen extends StatelessWidget { // 기본 홈 화면으로 사용할 HomeScreen 위젯 생성
  const HomeScreen({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light); // 상태바 색상 변경하는 코드
    return Scaffold(
      body: PageView( // PageView 추가
        children: [1, 2, 3, 4, 5] // 샘플 리스트 생성
        .map( // 위젯으로 매핑
            (number) => Image.asset("asset/img/image_$number.jpg", // asset에 있는 이미지 로딩
            fit: BoxFit.cover, // 부모ㅓ 위젯 전체를 덮는 선에서 최소한 크기로 조절
            ),
        )
            .toList(),
      ),
    );
  }
}