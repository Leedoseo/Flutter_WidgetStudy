import 'package:isar/isar.dart'; // MessageModel클래스를 Isar컬렉션으로 변경하기

part 'message_model.g.dart'; // flutter pub run build_runner build를 터미널로 실행해서 message_model.g.dart 파일 생성하고 불러오기

@collection
class MessageModel {
  Id id = Isar.autoIncrement;
  bool isMine;
  String message;
  int? point;
  DateTime date;

  MessageModel ({
    required this.id,
    required this.isMine,
    required this.message,
    required this.date,
    this.point,
  });
}