import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override

  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with
TickerProviderStateMixin { // TickerProviderStateMixin 사용 -> 애니메이션 효율 담당? 1프레임마다 애니메이션 실행
  TabController? controller; // 사용할 TabController 선언

  @override

  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this); // 컨트롤러 초기화
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
    return [];
  }

  BottomNavigationBar renderBottomNavigation() {
    return BottomNavigationBar(items: []); // 탭 내비게이션을 구현하는 위젯
  }
}


