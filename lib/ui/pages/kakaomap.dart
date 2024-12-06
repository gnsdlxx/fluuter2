import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class KakaoMapPage extends StatefulWidget {
  @override
  _KakaoMapPageState createState() => _KakaoMapPageState();
}

class _KakaoMapPageState extends State<KakaoMapPage> {
  //late GoogleMapController _mapController;  // GoogleMapController 사용
  final String kakaoApiKey = "YOUR_KAKAO_REST_API_KEY";  // 발급받은 Kakao REST API 키 입력
  final double defaultLatitude = 37.5665;  // 서울 중심 좌표
  final double defaultLongitude = 126.9784;

  List<Map<String, dynamic>> hospitalMarkers = [];  // 동물병원 데이터 저장

  @override
  void initState() {
    super.initState();
    fetchAnimalHospitals(defaultLatitude, defaultLongitude);
  }

  // Kakao Local API를 사용하여 동물 병원 데이터 가져오기
  Future<void> fetchAnimalHospitals(double latitude, double longitude) async {
    final url =
        'https://dapi.kakao.com/v2/local/search/category.json?category_group_code=HP8&x=$longitude&y=$latitude&radius=2000';
    final headers = {'Authorization': 'KakaoAK $kakaoApiKey'};

    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        hospitalMarkers = List<Map<String, dynamic>>.from(data['documents']);
      });
    } else {
      print("Failed to fetch data: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("주변 동물 병원"),
        backgroundColor: Colors.green,
      ),
      body: GoogleMap(
        /*onMapCreated: (controller) {
          _mapController = controller;
        },*/
        initialCameraPosition: CameraPosition(
          target: LatLng(defaultLatitude, defaultLongitude),
          zoom: 13,
        ),
        markers: Set<Marker>.from(
          hospitalMarkers.map((hospital) {
            final name = hospital['place_name'];
            final lat = double.parse(hospital['y']);
            final lng = double.parse(hospital['x']);
            return Marker(
              markerId: MarkerId(name),
              position: LatLng(lat, lng),
              infoWindow: InfoWindow(title: name),
              icon: BitmapDescriptor.defaultMarker,
            );
          }),
        ),
      ),
    );
  }
}
