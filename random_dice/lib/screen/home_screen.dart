import 'package:random_dice/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final int number;

  const HomeScreen({
    required this.number,
    Key? key,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset("asset/img/$number.png"),
        ),
        SizedBox(height: 32.0),
        Text(
          "행운의 숫자",
          style: TextStyle(
            color: secondaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 12.0),
        Text(
          number.toString(),
          style: TextStyle(
            color: primaryColor,
            fontSize: 60.0,
            fontWeight: FontWeight.w200,
          ),
        )
      ],
    );
  }
}