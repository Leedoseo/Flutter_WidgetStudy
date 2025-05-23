import 'package:flutter/material.dart';
import 'package:random_dice/screen/home_screen.dart';
import 'package:random_dice/screen/settings_screen.dart';
import "dart:math";
import "package:shake/shake.dart";

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override

  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin { // TickerProviderStateMixin 사용 -> 애니메이션 효율 담당? 1프레임마다 애니메이션 실행

  TabController? controller;
  double threshold = 2.7; // 민감도의 기본값 설정
  int number = 1; // 주사위 숫자
  ShakeDetector? shakeDetector;

  @override

  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
    controller!.addListener(tabListener); // 컨트롤러 속성이 변경될 때마다 실행할 함수 등록

    shakeDetector = ShakeDetector.autoStart( // 흔들기 감지 즉시 시작
      shakeSlopTimeMS: 100, // 감지 주기
      shakeThresholdGravity: threshold, // 감지 민감도
      onPhoneShake: onPhoneShake, // 감지 후 실행할 함수
    );
  }

  void onPhoneShake() {
    final rand = new Random();

    setState(() {
      number = rand.nextInt(5) + 1;
    });
  }

  tabListener() { // 리스너로 사용할 함수
    setState(() {});
  }

  @override

  dispose() {
    controller!.removeListener(tabListener); // 리스너에 등록한 함수 등록 취소
    shakeDetector!.stopListening(); // 흔들기 감지 중지
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView( // 탭바를 보여줄 위젯
        controller: controller,
        children: renderChildren(),
      ),
      bottomNavigationBar: renderBottomNavigation(), // 아래 탭 내비게이션을 구현하는 파라미터
    );
  }

  List<Widget> renderChildren() {
    return [
      HomeScreen(number: number), // number 변수로 대체
      SettingsScreen(
        threshold: threshold,
        onThresholdChange: onThresholdChange,
      ),
    ];
  }

  void onThresholdChange(double val) {
    setState(() {
      threshold = val;
    });
  }

  BottomNavigationBar renderBottomNavigation() {
    return BottomNavigationBar( // 탭 내비게이션을 구현하는 위젯
      currentIndex: controller!.index,
        onTap: (int index) {
          setState(() {
            controller!.animateTo(index);
          });
        },
        items: [
          BottomNavigationBarItem( // 하단 탭바의 각 버튼 구현
              icon: Icon(
                Icons.edgesensor_high_outlined,
              ),
            label: '주사위',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
            label: "설정",
          ),
        ],
    );
  }
}


