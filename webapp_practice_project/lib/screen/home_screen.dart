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

        // 앱바에 액션 버튼을 추가할 수 있는 파라미터
        actions: [ // action은 우측부터 버튼을 채움 -> 오른쪽 정렬이 기본! 그래서 홈버튼을 만들면 우측 끝으로 갈 것임
          IconButton( // 홈버튼을 만들거기 떄문에 IconButton사용
            onPressed: (){ // 아이콘을 눌렀을 떄 실행할 콜백 함수
              // 웹뷰 위젯에서 사이트로 전환
              webViewController.loadRequest(Uri.parse("https://leedoseo.tistory.com/"));
            },

            // 아이콘 모양을 홈버튼 모양으로 설정
            icon: Icon(
              Icons.home,
            ),
          ),
        ],
      ),
      body: WebViewWidget(
        controller: webViewController, // webViewController 선언완료! -> 시뮬 돌리면 이제 잘 작동함
      ),
    );
  }
}