import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // 쿠퍼티노 위젯 사용하기 위해 필요 -> 날짜 고르는 기능

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();

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
            _DDay(
              // 하트를 눌렀을 때 실행할 함수 전달하기
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            _CoupleImage(),
          ],
        )
      )
    );
  }
  void onHeartPressed() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        // 날짜 선택하는 다이얼로그
        return CupertinoDatePicker(
          // 시간 제외하고 날짜만 선택하기
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (DateTime date) {},
        );
      },
    );
  }
}

class _DDay extends StatelessWidget { // D-day 위젯 생성

  // 하트를 눌렀을 때 실행할 함수
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay; // 사귀기 시작한 날

  _DDay({
    required this.onHeartPressed,
    required this.firstDay, // 날짜 변수로 받기
});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme; // 테마 불러오기
    final now = DateTime.now(); // 현재 날짜시간

    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text( // 최상단 U&I 텍스트
          "U&I",
          style: textTheme.displayLarge,
        ),
        const SizedBox(height: 16.0),
        Text( // 두 번째 텍스트
          "우리 처음 만난 날",
          style: textTheme.bodyLarge,
        ),
        Text( // DateTime을 년. 월. 일 형태로 변경
          "${firstDay.year}.${firstDay.month}.${firstDay.day}",
          style: textTheme.bodyMedium,
        ),
        const SizedBox(height: 16.0),
        IconButton(
          iconSize: 60.0,
          onPressed: onHeartPressed,
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 16.0),
        Text( // 만난 후 D-day
          "D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}",
          style: textTheme.displayMedium,
        )
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget { // 커플 이미지 위젯 생성
  @override
  Widget build(BuildContext context) {
    return Expanded( // 이미지 중앙 정렬 -> Expanded 추가
      child: Center(
        child: Image.asset(
        "asset/img/middle_image.png",
        height: MediaQuery.of(context).size.height / 2, // 화면의 반만큼 높이 구현 -> Expanded가 우선 순위를 갖게되어 무시됨.
       ),
      ),
    );
  }
}