import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  static final LatLng companyLatLng = LatLng( // 지도 초기화 위치
    37.5233273, // 위도
    126.921252, // 경도
  );

  const HomeScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: Column(
        children: [
          Expanded( // 3분의 2만큼 공간 차지
            flex: 2,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: companyLatLng,
                zoom: 16, // 확대 정도 (높을 수록 크게 보임)
              ),
            ),
          ),
          Expanded( // 여기서 flex를 선언 안해도 위에서 2를 선언했기 때문에 나머지 범위를 버튼이 차지하게 됨.
            child: Column( // 3분의 1만큼 공간 차지
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon( // 시계 아이콘
                  Icons.timelapse_outlined,
                  color: Colors.blue,
                  size: 50.0,
                ),
                const SizedBox(height: 20.0),
                ElevatedButton( // 출근하기 버튼
                  onPressed: () {},
                  child: Text("출근하기!"),
                )
              ],
            ),
          )
        ],
      )
    );
  }

  AppBar renderAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "오늘도 출근",
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}