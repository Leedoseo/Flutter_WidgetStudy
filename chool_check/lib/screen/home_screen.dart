import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatelessWidget {
  static final LatLng companyLatLng = LatLng( // 지도 초기화 위치
    37.5233273, // 위도
    126.921252, // 경도
  );

  // 회사 위치 마커 선언
  static final Marker marker = Marker(
    markerId: MarkerId("company"),
    position: companyLatLng,
  );

  static final Circle circle = Circle(
    circleId: CircleId("choolCheckCircle"),
    center: companyLatLng, // 원의 중심이 되는 위치 LatLng값을 제공함
    fillColor: Colors.blue.withOpacity(0.5), // 원의 색상
    radius: 100, // 원의 반지름(미터 단위)
    strokeColor: Colors.blue, // 원의 테두리 색
    strokeWidth: 1, // 원의 테두리 두께
  );

  const HomeScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: FutureBuilder<String> (
        future: checkPermission(),
        builder: (context, snapshot) {
          if (!snapshot.hasData && // 로딩 상태
              snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == "위치 권한이 허가 되었습니다.") { // 권한이 허가된 상태
            return Column(
              children: [
                Expanded( // 3분의 2만큼 공간 차지
                  flex: 2,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: companyLatLng,
                      zoom: 16, // 확대 정도 (높을 수록 크게 보임)
                    ),
                    myLocationEnabled: true, // 내 위치 지도에 보이기
                    markers: Set.from([marker]),
                    circles: Set.from([circle]),
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
                        onPressed: () async {
                          final curPosition = await Geolocator.getCurrentPosition(); // 현재 위치

                          final distance = Geolocator.distanceBetween(
                            curPosition.latitude, // 현재 위치 위도
                            curPosition.longitude, // 현재 위치 경도
                            companyLatLng.latitude, // 회사 위치 위도
                            companyLatLng.longitude, // 회사 위치 경도
                          );

                          bool canCheck = distance < 100;

                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: Text("출근하기"),

                                content: Text(
                                  canCheck ? "출근을 하시겠습니까?" : "출근을 할 수 없는 위치입니다.",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: Text("취소"),
                                  ),
                                  if (canCheck)
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                        child: Text("출근하기"),
                                    )
                                ],
                              );
                            }
                          );
                        },
                        child: Text("출근하기!"),
                      )
                    ],
                  ),
                )
              ],
            );
          }
          return Center( // 권한이 없는 상태
            child: Text(
              snapshot.data.toString(),
            ),
          );
        }
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

  Future<String> checkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled(); // 위치 서비스 활성화 여부 확인

    if (!isLocationEnabled) { // 위치 서비스 활성화가 안됬다면 출력
      return "위치 서비스를 활성화해주세요.";
    }

    LocationPermission checkedPermission = await Geolocator.checkPermission(); // 위치 권한 확인

    if (checkedPermission == LocationPermission.denied) { // 위치 권한이 거절 됐다면
      checkedPermission = await Geolocator.requestPermission();

      if (checkedPermission == LocationPermission.denied) { // 위치 권한 요청하기
        return "위치 권한을 허가해주세요.";
      }
    }

    if (checkedPermission == LocationPermission.deniedForever) { // 위치 권한 거절됨 (앱에서 재요청 불가)
      return "앱의 위치 권한을 설정에서 허가해주세요.";
    }

    return "위치 권한이 허가 되었습니다."; // 위 조건이 모두 만족됐을 경우 위치 권한 허가 완료.
  }
}