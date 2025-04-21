import "package:flutter/material.dart";
import "package:flutter/services.dart"; // 상태바 색상 변경 위한 패키지
import 'dart:async'; // async 패키지 불러오기

class HomeScreen extends StatefulWidget {
  // 기본 홈 화면으로 사용할 HomeScreen 위젯 생성
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // PageController 생성
  final PageController pageController = PageController();

  @override
  void initState() { // initState 함수 등록
    super.initState(); // 부모 initState 실행

    Timer.periodic(
      Duration(seconds: 3),
        (timer) {
          int? nextPage = pageController.page?.toInt();// 현재 페이지 가져오기

          if (nextPage == null) { // 페이지 값이 없을 때 예외 처리
            return;
          }

          if (nextPage == 4) { // 첫 페이지와 마지막 페이지 분기처리 => 페이지 값이 4면 0번째 페이지부터 다시 시작
            nextPage = 0;
          } else {
            nextPage++;
          }
          pageController.animateToPage( // 페이지 변경
            nextPage,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
    );
  }
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light); // 상태바 색상 변경하는 코드
    return Scaffold(
      body: PageView( // PageView 추가
        controller: pageController,
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


