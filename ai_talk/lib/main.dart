import 'package:ai_talk/screen/home_screen.dart';
import 'package:flutter/material.dart';
// Isar 초기화 및 생성된 Isar 객체를 GetIt에 등록해 프로젝트 어디서든 사용할 수 있게함
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ai_talk/model/message_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 플러터 프레임워크가 실행 준비될 때까지 기다리기

  final dir = await getApplicationDocumentsDirectory(); // 앱에 배정된 폴더 경로 가져오기

  final isar = await Isar.open( // Isar 데이터베이스 초기화
    [MessageModelSchema],
    directory: dir.path,
  );

  GetIt.I.registerSingleton<Isar>(isar);

  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}