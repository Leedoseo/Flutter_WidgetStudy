import 'package:flutter/material.dart';

// layout - Row
void main() {
  runApp(RowWidgetExample());
}

class RowWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          // 반대축에서 이동할 공간을 제공하기 위해 높이를 최대한으로 설정
          height: double.infinity,
          child: Row(

            // 주축 정렬 지정 -> 좌측부터 차곡차곡 위젯을 나열하겠다는 뜻
            mainAxisAlignment: MainAxisAlignment.start,
            // 반대축 정렬 지정 -> 각 Container들이 Row의 세로 높이 기준으로 중앙에 위치하게만든다는 뜻
            crossAxisAlignment: CrossAxisAlignment.center,

            // 넣고 싶은 위젯 입력
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),

              // SizedBox는 일반적으로 공백을 생성할 때 사용
              const SizedBox(width: 12.0),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.green,
              ),
              const SizedBox(width: 12.0),
              Container(
              height: 50.0,
              width: 50.0,
              color: Colors.blue,
              ),
            ],
          ),
        )
      )
    );
  }
}

// layout - Column
void main() {
  runApp(ColumnWidgetExample());
}

class ColumnWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SizedBox(
              // 반대축에서 이동할 공간을 제공하기 위해 높이를 최대한으로 설정
              width: double.infinity,
              child: Column(
                // 주축 정렬 지정 ->
                mainAxisAlignment: MainAxisAlignment.start,
                // 반대축 정렬 지정
                crossAxisAlignment: CrossAxisAlignment.center,

                // 넣고 싶은 위젯 입력
                children: [
                  Container(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.red,
                  ),

                  // SizedBox는 일반적으로 공백을 생성할 때 사용
                  const SizedBox(height: 12.0),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 12.0),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
        ),
    );
  }
}

// layout - Flexible
void main() {
  runApp(FlexibleWidgetExample());
}

class FlexibleWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          // 반대축에서 이동할 공간을 제공하기 위해 높이를 최대한으로 설정
          width: double.infinity,
          child: Column(
            children: [
              Flexible(
                // flex는 남은 공간을 차지할 비율을 의미. flex값을 제공하지 않으면 기본값은 1
                flex: 1,

                child: Container(
                  color: Colors.blue,
                ),
              ),
              Flexible(
                flex: 1,

                child: Container(
                  color: Colors.red,
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

// layout - Expanded
void main() {
  runApp(ExpandedWidgetExample());
}

class ExpandedWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          // 반대축에서 이동할 공간을 제공하기 위해 높이를 최대한으로 설정
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
                  ),
                ),

                Expanded(
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}

// layout - Stack
void main() {
  runApp(StackWidgetExample());
}

class StackWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          // 반대축에서 이동할 공간을 제공하기 위해 높이를 최대한으로 설정
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: 300.0,
                  width: 300.0,
                  color: Colors.red,
                ),
                Container(
                  height: 250.0,
                  width: 250.0,
                  color: Colors.yellow,
                ),
                Container(
                  height: 200.0,
                  width: 200.0,
                  color: Colors.blue,
                ),
              ],
            ),
        ),
      ),
    );
  }
}