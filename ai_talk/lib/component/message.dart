import 'package:flutter/material.dart';
import 'package:ai_talk/component/point_notification.dart';

class Message extends StatelessWidget {
  final bool alignLeft; // true면 왼쪽 정렬, false면 오른쪽 정렬
  final String message; // 보여줄 메세지
  final int? point; // 현재까지 적립된 포인트

  const Message({
    super.key,
    this.alignLeft = true,
    this.point,
    required this.message,
  });

  @override

  Widget build(BuildContext context) {
    final alignment = alignLeft ? Alignment.centerLeft : Alignment.centerRight; // alignLeft 기준으로 Alignment 프로퍼티 생성
    final bgColor = alignLeft ? Color(0xFFF4F4F4) : Colors.white; // 왼쪽 정렬이면 더 어두운 배경 사용
    final border = alignLeft ? Color(0xFFE7E7E7) : Colors.black12; // 왼쪽 정렬일 경우 더 어두운 테두리 사용

    return Column(
      children: [
        Align(
          alignment: alignment,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.0),
              color: bgColor,
              border: Border.all(
                color: border,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        if (point != null) // 포인트가 입력됐을 때만 PointNotification 위젯을 화면에 출력
          Align(
            alignment: alignment,
            child: PointNotification(
              point: point!,
            ),
          ),
      ],
    );
  }
}