import 'package:flutter/material.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView( // 탭바를 보여줄 위젯
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