import 'package:ai_talk/component/message.dart';
import 'package:flutter/material.dart';
import 'package:ai_talk/component/logo.dart'; // 로고 불러오기
import 'package:ai_talk/model/message_model.dart'; // message_model 파일 불러오기
import 'package:ai_talk/component/message.dart'; // 메세지 파일 불러오기
import 'package:ai_talk/component/date_divider.dart'; // date_divider 파일 불러오기
import 'package:ai_talk/component/chat_text_field.dart'; // 채팅 입력 텍스트 필드 불러오기
import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:isar/isar.dart';

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
  final TextEditingController controller = TextEditingController(); // 텍스트 에딧 컨트롤러 구현

  bool isRunning = false; // 로딩여부 확인 변수
  String? error; // 에러 메세지 변수

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // SafeArea 구현
       child: Column( // ListView와 TextField를 세로로 정렬
         children: [
           Expanded( // ListView가 화면을 최대한 차지하도록 설정
             child: buildMessageList(),
           ),
           ChatTextField(
             error: error,
             loading: isRunning,
             onSend: handleSendMessage,
             controller: controller,
           ),
         ],
       ),
      ),
    );
  }

  handleSendMessage() async { // 메세지 보내기 버튼을 누르면 실행할 함수
    if(controller.text.isEmpty) { // 텍스트 필드에 입력된 메세지가 없으면 에러 보여주기
      setState(() => error = "메세지를 입력해주세요");
      return;
    }

    int? currentModelMessageId; // 현재 응답 받고 있는 메세지 ID (스트림으로 지속적으로 업데이트하기)
    int? currentUserMessageId; // 내가 보낸 메세지에 배정된 ID (에러가 발생하면 삭제하기)

    final isar = GetIt.I<Isar>(); // Isar 인스턴스 가져오기
    final currentPrompt  = controller.text; // TextField에 입력된 값 가져오기

    try {
      setState(() { // 로딩 중으로 상태 변경
        isRunning = true;
      });

      controller.clear(); // TextField에 입력된 값 모두 삭제

      final myMesageCount = await isar.messageModels.filter().isMineEqualTo(true).count(); // 현재 데이터베이스에 저장되어 있는 내가 보낸 메세지 숫자 세기(포인트용도)

      currentUserMessageId = await isar.writeTxn(() async { // 내가 보낸 메세지 Isar에 저장하기
        return await isar.messageModels.put(
          MessageModel(
            isMine: true,
            message: currentPrompt,
            point: myMesageCount + 1,
            date: DateTime.now(),
          ),
        );
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()))); // 에러가 있을 경우 SnackBar로 에러 메세지 표시해주기
    }
  }

  Widget buildMessageList() {
    return ListView.separated(
      itemCount: sampleData.length + 1,
      itemBuilder: (context, index)
      => index == 0 ? buildLogo() : buildMessageItem(message: sampleData[index - 1],
        prevMessage: index > 1 ? sampleData[index -2] : null,
        index: index - 1,
      ),
      separatorBuilder: (_, __) => const SizedBox(height: 16.0,),
    );
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