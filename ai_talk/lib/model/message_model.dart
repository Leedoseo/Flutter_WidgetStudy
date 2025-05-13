class MessageModel {
  final int id; // MessageID
  final bool isMine; // true: 내가 보낸 메세지 / false : AI가 보낸 메세지
  final String message; // 메세지 내용
  final int? point; // 포인트 (AI의 경우 null)
  final DateTime date; // 메세지 전송 날짜

  MessageModel ({
    required this.id,
    required this.isMine,
    required this.message,
    required this.date,
    this.point,
  });
}