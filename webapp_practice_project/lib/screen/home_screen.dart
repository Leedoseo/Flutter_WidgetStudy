import "package:flutter/material.dart";
import "package:webview_flutter/webview_flutter.dart"; // Flutter의 머터리얼 디자인 위젯들을 사용하기 위한 패키지

class HomeScreen extends StatelessWidget { // HomeScreen이라는 StatelessWidget 클래스 선언

  WebViewController webViewController = WebViewController()

  ..loadRequest(Uri.parse("https://leedoseo.tistory.com/"))

  ..setJavaScriptMode(JavaScriptMode.unrestricted);

  // const가 지워진이유 -> .loadRequset와 .setJavaScriptMode는 런타임에 실행되는 코드기 때문에 HomeScreen위젯에서 const로 선언한 걸 지워야했음!
  HomeScreen({Key? key}) : super(key : key); // const 생성자 삭제
                                                   // Key는 위젯 트리를 효율적으로 관리하기 위한 식별자

  @override
  Widget build(BuildContext context) {
    return Scaffold( // 화면의 기본 뼈대를 구성하는 Scaffold 위젯 리턴

      // 앱바 위젯 추가
      appBar: AppBar(
        // 앱바의 배경색
        backgroundColor: Colors.orange,
        // 앱바의 타이틀 설정
        title: Text("도서의 코딩노트"),
        // 가운데 정렬
        centerTitle: true,
      ),
      body: WebViewWidget(
        controller: webViewController, // webViewController 선언완료! -> 시뮬 돌리면 이제 잘 작동함
      ),
    );
  }
}