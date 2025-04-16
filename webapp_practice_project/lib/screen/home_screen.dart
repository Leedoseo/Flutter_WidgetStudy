import "package:flutter/material.dart"; // Flutter의 머터리얼 디자인 위젯들을 사용하기 위한 패키지

class HomeScreen extends StatelessWidget { // HomeScreen이라는 StatelessWidget 클래스 선언

  // const 생성자
  const HomeScreen({Key? key}) : super(key : key); // const 생성자: 불변 위젯이기 때문에 const로 선언 가능
                                                   // Key는 위젯 트리를 효율적으로 관리하기 위한 식별자

  @override
  Widget build(BuildContext context) {
    return Scaffold( // 화면의 기본 뼈대를 구성하는 Scaffold 위젯 리턴
      body: Text("Home Screen"),
    );
  }
}