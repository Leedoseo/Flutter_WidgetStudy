import 'package:flutter/material.dart';
import 'package:ai_talk/component/logo.dart'; // 로고 불러오기 

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
}