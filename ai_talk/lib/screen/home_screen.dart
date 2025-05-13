import 'package:ai_talk/component/message.dart';
import 'package:flutter/material.dart';
import 'package:ai_talk/component/logo.dart'; // 로고 불러오기
import 'package:ai_talk/model/message_model.dart'; // message_model 파일 불러오기
import 'package:ai_talk/component/message.dart'; // 메세지 파일 불러오기
import 'package:ai_talk/component/date_divider.dart'; // date_divider 파일 불러오기

final sampleData = [ // 샘플 데이터 설정
  MessageModel(
    id: 1,
    isMine: true,
    message: "오늘 저녁으로 먹을 만한 메뉴 추천해줘",
    point: 1,
    date: DateTime(2024, 11, 23),
  ),
  MessageModel(
      id: 2,
      isMine: false,
      message: "김치찜은 어떠세요?",
      point: null,
      date: DateTime(2024, 11, 23)
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override

  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override

  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget buildLogo() { // 가로 세로 패딩과 함께 Logo를 반환하는 _buildLogo()함수
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: const Padding(
        padding: EdgeInsets.only(bottom: 60.0),
        child: Logo(),
      ),
    );
  }

  Widget buildMessageItem ({
    MessageModel? prevMessage,
    required MessageModel message,
    required int index,
  }) {
    final isMine = message.isMine;
    final shouldDrawDateDivider = prevMessage == null || shouldDrawDate(prevMessage.date!, message.date!); // DateDivider 위젯을 그려야 하는지 판단하기

    return Column(
      children: [
        if (shouldDrawDateDivider) // Datedivider 위젯을 그려야 하는지 판단하기
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: DateDivider(date: message.date),
          ),

        Padding( // 정렬 위치에 따라 패딩 다르게 제공해주기
          padding: EdgeInsets.only(left: isMine ? 64.0 : 16.0, right: isMine ? 16.0 : 64.0),
          child: Message(
            alignLeft: !isMine,
            message: message.message.trim(),
            point: message.point,
          ),
        )
      ],
    );
  }

  bool shouldDrawDate(DateTime date1, DateTime date2) {
    return getStringDate(date1) != getStringDate(date2);
  }

  String getStringDate(DateTime date) {
    return "${date.year}년 ${date.month}월 ${date.day}일";
  }
}