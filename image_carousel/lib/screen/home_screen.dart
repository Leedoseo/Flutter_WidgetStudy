import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [1, 2, 3, 4, 5]
        .map(
            (number) => Image.asset("asset/img/image_$number.jpg"),
        )
            .toList(),
      ),
    );
  }
}